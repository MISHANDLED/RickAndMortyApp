//
//  LocationsModel.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation


struct LocationsResult: Decodable {
    let results: [SeriesLocation]?
    let info: AdditionalInfo?
    
    struct SeriesLocation: Decodable {
        let locationID: Int?
        let locationName: String?
        let locationType: String?
        let locationDimension: String?
        let locationCharacters: [String]?
        
        private enum CodingKeys: String, CodingKey {
            case locationID = "id"
            case locationName = "name"
            case locationType = "type"
            case locationDimension = "dimension"
            case locationCharacters = "residents"
        }
    }
    
    struct AdditionalInfo: Decodable {
        let next: String?
    }
}
