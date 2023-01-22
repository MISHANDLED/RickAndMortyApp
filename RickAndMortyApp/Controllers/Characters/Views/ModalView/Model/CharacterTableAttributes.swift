//
//  CharacterTableAttributes.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 22/01/23.
//

import Foundation

enum CharacterTableAttributes: CustomStringConvertible {
    case deadOrAlive(value: String)
    case species(value: String)
    case gender(value: String)
    case originPlace(value: String)
    case currentLocation(value: String)
    
    var description: String {
        switch self {
        case .deadOrAlive(value: _):
            return "Dead Or Alive"
        case .species(value: _):
            return "Anatomy"
        case .gender(value: _):
            return "Gender"
        case .originPlace(value: _):
            return "Place of Origin"
        case .currentLocation(value: _):
            return "Last Known Location"
        }
    }
    
    func associatedValue() -> String {
        switch self {
        case .deadOrAlive(value: let value):
            return value
        case .species(value: let value):
            return value
        case .gender(value: let value):
            return value
        case .originPlace(value: let value):
            return value
        case .currentLocation(value: let value):
            return value
        }
    }
}
