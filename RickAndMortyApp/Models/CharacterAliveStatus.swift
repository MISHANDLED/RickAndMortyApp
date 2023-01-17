//
//  CharacterAliveStatus.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation

enum CharacterAliveStatus: String, Decodable {
    case dead = "Dead"
    case alive = "Alive"
    case unknown = "unknown"
}
