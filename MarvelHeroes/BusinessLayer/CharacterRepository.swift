//
//  CharacterRepository.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 18.07.2021.
//

import Foundation

protocol ICharacterRepository {
	func loadCharacter(name: String, _ completion: @escaping (CharacterResult) -> Void)
	func loadImage(imageUrl: String, _ completion: @escaping (ImageResult) -> Void)
}

final class CharacterRepository
{
	private let networkService: INetworkService

	init(networkService: INetworkService) {
		self.networkService = networkService
	}
}

extension CharacterRepository: ICharacterRepository
{
	func loadCharacter(name: String, _ completion: @escaping (CharacterResult) -> Void) {
		networkService.loadCharacter(name: name) { result in
			completion(result)
		}
	}

	func loadImage(imageUrl: String, _ completion: @escaping (ImageResult) -> Void) {
		networkService.loadImage(imageUrl: imageUrl) { image in
			completion(image)
		}
	}
}

