//
//  ServiceError.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 18.07.2021.
//

import Foundation

enum ServiceError: Error {
	case sessionError(Error)
	case notFound(Error)
	case dataError(Error)
	case statusCode(Int)
}
