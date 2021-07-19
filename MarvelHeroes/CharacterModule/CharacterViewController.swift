//
//  CharacterViewController.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 17.07.2021.
//

import UIKit

protocol ICharacterViewController: AnyObject {
	func show(_ characters: [Character])
}

class CharacterViewController: UIViewController {

	private let placeholderOfSearchBar = "Find character"
	private let titleOfView = "🦸‍♂️ Heroes"

	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()

	private lazy var searchController: UISearchController = {
		let controller = UISearchController(searchResultsController: nil)
		controller.searchBar.delegate = self
		controller.obscuresBackgroundDuringPresentation = false
		controller.searchBar.placeholder = placeholderOfSearchBar
		navigationItem.hidesSearchBarWhenScrolling = false
		definesPresentationContext = true
		return controller
	}()

	private let presenter: ICharacterPresenter
	private var characters = [Character]()

	init(presenter: ICharacterPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		view.addSubview(tableView)
		navigationItem.searchController = searchController
		setupUI()
		setupConstraints()
    }

	private func setupUI() {
		tableView.register(CharacterCell.self, forCellReuseIdentifier: "Cell")
		navigationController?.navigationBar.prefersLargeTitles = true
		title = titleOfView
		view.backgroundColor = .white
	}

	private func setupConstraints() {

		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}

extension CharacterViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return characters.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CharacterCell
		cell?.nameLabel.text = characters[indexPath.row].name
		cell?.descriptionLabel.text = characters[indexPath.row].description.isEmpty
			? "No info"
			: characters[indexPath.row].description

		if let path = characters[indexPath.row].thumbnail.path,
			let imageExtension = characters[indexPath.row].thumbnail.imageExtension {
			let urlString = "\(path).\(imageExtension)"
			presenter.getCharacterImage(imageUrl: urlString) { image in
				cell?.characterImageView.image = image
			}
		}
		return cell ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
	}
}

extension CharacterViewController: UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let searchText = searchBar.text, searchText.isEmpty == false else { return }
		presenter.getCharacters(name: searchText)
		tableView.isHidden = false
		self.tableView.reloadData()
	}
}

extension CharacterViewController: ICharacterViewController {
	func show(_ characters: [Character]) {
		self.characters = characters
		if self.characters.count > 0 {
			self.tableView.reloadData()
		}
	}
}
