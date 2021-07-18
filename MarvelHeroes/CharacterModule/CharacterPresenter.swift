//
//  CharacterPresenter.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import Foundation

protocol ICharacterPresenter {
	func getCharacters(name: String)
	func getCharacterImage(imageUrl: String)
}

class CharacterPresenter {

	private var router: ICharacterRouter
	var view: ICharacterViewController?

	init(router: ICharacterRouter) {
		self.router = router
	}
}

extension CharacterPresenter: ICharacterPresenter {

	func getCharacters(name: String) {

	}

	func getCharacterImage(imageUrl: String) {

	}
}
