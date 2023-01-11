//
//  ErrorCases.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 10/01/23.
//

enum ErrorHandler: Error {
    case InvalidURL
    case InternalServerError(Error?)
    case ErrorInParsing(Error)
}
