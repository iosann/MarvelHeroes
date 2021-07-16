//
//  Character.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 16.07.2021.
//

import Foundation

struct DataWrapper: Decodable
{
	let code: Int
	let status: String
	let copyright: String
	let attributionText: String
	let attributionHTML: String
	let etag: String
	let data: DataContainer
}

struct DataContainer: Decodable
{
	let offset: Int
	let limit: Int
	let total: Int
	let count: Int
	let results: [Character]
	let etag: String?
}

struct Character: Decodable
{
	let id: Int
	let name: String
	let description: String
	let thumbnail: Image
}

struct Image: Decodable
{
	let path: String?
	let imageExtension: String?

	enum CodingKeys: String, CodingKey
	{
		case path
		case imageExtension = "extension"
	}
}

