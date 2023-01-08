//
//  CharactersModel.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation


struct CharactersResult: Decodable {
    let results: [SeriesCharacter]?
    let next: String?
    
    struct SeriesCharacter: Decodable {
        let id: Int?
        let name: String?
        let status: CharacterAliveStatus?
        let species: String?
        let gender: CharacterGender?
        let origin: Origin?
        let location: Location?
        let image: String?
        let episode: [String]?
        
        struct Origin: Decodable {
            let name: String?
            let url: String?
        }
        
        struct Location: Decodable {
            let name: String?
            let url: String?
        }
    }
}
