//
//  NetworkService.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 18.07.2021.
//

import UIKit

typealias DataResult = Result<Data, ServiceError>
typealias CharacterResult = Result<[Character], ServiceError>

protocol INetworkService {
	func loadCharacter(name: String, _ completion: @escaping(CharacterResult) -> Void)
}

class NetworkService {

	private let timestamp = "\(Date().timeIntervalSince1970)"

	private lazy var hash = "\(timestamp)\(URLConstants.privateKey.rawValue)\(URLConstants.publicKey.rawValue)".md5

	private func fetchData(from url: URL, _ completion: @escaping(DataResult) -> Void) {

		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(.sessionError(error)))
				return
			}
			if let data = data, let response = response as? HTTPURLResponse {
				if 400..<500 ~= response.statusCode {
					completion(.failure(ServiceError.statusCode(response.statusCode)))
					return
				}
				completion(.success(data))
			}
		}
		task.resume()
	}
}

extension NetworkService: INetworkService {

	func loadCharacter(name: String, _ completion: @escaping (CharacterResult) -> Void) {
		
		let queryItems = [
			URLQueryItem(name: "nameStartsWith", value: name),
			URLQueryItem(name: "limit", value: URLConstants.issueLimit.rawValue),
			URLQueryItem(name: "ts", value: timestamp),
			URLQueryItem(name: "apikey", value: URLConstants.publicKey.rawValue),
			URLQueryItem(name: "hash", value: hash),
		]

		guard let baseUrl = URL(string: URLConstants.baseUrlString.rawValue) else { return }
		var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
		urlComponents?.queryItems = queryItems
		guard let url = urlComponents?.url else { return }

		fetchData(from: url) { dataResult in
			switch dataResult {
			case .success(let data):
				do {
					let result = try JSONDecoder().decode(DataWrapper.self, from: data)
					completion(.success(result.data.results))
				}
				catch {
					completion(.failure(ServiceError.dataError(error)))
				}
			case .failure(let error):
				completion(.failure(error))
				print(error.localizedDescription)
			}
		}
	}
}
