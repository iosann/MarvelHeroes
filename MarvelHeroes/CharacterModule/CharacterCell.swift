//
//  CharacterCell.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 18.07.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

	var characterImageView = UIImageView()
	var nameLabel = UILabel()
	var descriptionLabel = UILabel()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubview(characterImageView)
		addSubview(nameLabel)
		addSubview(descriptionLabel)
		configureCell()
		setupConstraints()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	private func configureCell() {
		characterImageView.layer.cornerRadius = 35
		characterImageView.clipsToBounds = true
		nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
		nameLabel.textAlignment = .left
		descriptionLabel.textAlignment = .left
	}

	private func setupConstraints() {
		characterImageView.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			characterImageView.widthAnchor.constraint(equalToConstant: 70),
			characterImageView.heightAnchor.constraint(equalToConstant: 70),
			characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			characterImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),

			nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
			nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

			descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
			descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
		])
	}
}
