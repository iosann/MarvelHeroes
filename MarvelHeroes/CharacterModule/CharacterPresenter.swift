//
//  CharacterPresenter.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import Foundation

protocol ICharacterPresenter { }

class CharacterPresenter: ICharacterPresenter {

	private var router: ICharacterRouter
	var view: ICharacterViewController?

	init(router: ICharacterRouter) {
		self.router = router
	}
}
