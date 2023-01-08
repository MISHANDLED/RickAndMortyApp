//
//  Endpoints.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation

enum URLManager: CustomStringConvertible {
    case character,
    location,
    episode
    
    var description: String {
        switch self {
        case .character:
            return "character"
        case .location:
            return "location"
        case .episode:
            return "episode "
        }
    }
}
