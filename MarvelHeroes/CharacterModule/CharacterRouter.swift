//
//  CharacterRouter.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import Foundation

protocol ICharacterRouter { }

class CharacterRouter: ICharacterRouter {

	private let factory: Factory
	weak var viewController: CharacterViewController?

	init(factory: Factory) {
		self.factory = factory
	}
}
