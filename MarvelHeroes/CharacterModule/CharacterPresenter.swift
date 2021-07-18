//
//  CharacterPresenter.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import Foundation

protocol ICharacterPresenter {
	func getCharacters(name: String)
}

class CharacterPresenter {

	private var repository: ICharacterRepository
	private var router: ICharacterRouter
	weak var view: ICharacterViewController?

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
					print(characters)
				}
			case .failure(let error):
			assertionFailure(error.localizedDescription)
			}
		}
	}
}
