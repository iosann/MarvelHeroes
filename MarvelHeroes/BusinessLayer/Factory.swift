//
//  Factory.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import Foundation

class Factory {
	
	func getCharacterViewController() -> CharacterViewController {
		let networkService = NetworkService()
		let repository = CharacterRepository(networkService: networkService)
		let router = CharacterRouter(factory: self)
		let presenter = CharacterPresenter(router: router, repository: repository)
		let viewController = CharacterViewController(presenter: presenter)
		router.viewController = viewController
		presenter.view = viewController
		return viewController
	}
}
