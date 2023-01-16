//
//  EpisodesModel.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation


struct EpisodesResult: Decodable {
    let results: [SeriesEpisode]?
    let info: AdditionalInfo?
    
    struct SeriesEpisode: Decodable {
        let id: Int?
        let episodeName: String?
        let airDate: String?
        let episodeAnn: String?
        let characters: [String]?
        
        private enum CodingKeys: String, CodingKey {
            case id
            case episodeName = "name"
            case airDate = "air_date"
            case episodeAnn = "episode"
            case characters
        }
    }
    
    struct AdditionalInfo: Decodable {
        let next: String?
    }
    
    private enum CodingKeys: String, CodingKey {
        case results
        case info
    }
}
