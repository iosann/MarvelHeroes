//
//  CharacterPresenter.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import UIKit

protocol ICharacterPresenter {
	func getCharacters(name: String)
	func getCharacterImage(imageUrl: String, _ completion: @escaping (UIImage?) -> Void)
}

class CharacterPresenter {

	private var repository: ICharacterRepository
	private var router: ICharacterRouter
	weak var view: ICharacterViewController?
	private var characters = [Character]()

	init(router: ICharacterRouter, repository: ICharacterRepository) {
		self.router = router
		self.repository = repository
	}
}

extension CharacterPresenter: ICharacterPresenter {

	func getCharacters(name: String) {
		repository.loadCharacter(name: name) { result in
			switch result {
			case .success(let characters):
				DispatchQueue.main.async {
					self.view?.show(characters)
				}
			case .failure(let error):
			assertionFailure(error.localizedDescription)
			}
		}
	}

	func getCharacterImage(imageUrl: String, _ completion: @escaping (UIImage?) -> Void) {
		repository.loadImage(imageUrl: imageUrl) { imageResult in
			switch imageResult {
			case .success(let image):
				DispatchQueue.main.async {
					completion(image)
				}
			case .failure(let error):
			assertionFailure(error.localizedDescription)
			}
		}
	}
}
