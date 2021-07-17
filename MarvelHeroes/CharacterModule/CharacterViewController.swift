//
//  CharacterViewController.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import UIKit

protocol ICharacterViewController { }

class CharacterViewController: UIViewController, ICharacterViewController {

	private let presenter: ICharacterPresenter

	init(presenter: ICharacterPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
