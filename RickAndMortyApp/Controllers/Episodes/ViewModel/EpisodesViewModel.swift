//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 19/01/23.
//

import Foundation

protocol EpisodesViewModelProtocol {
    func callThatAPI(isInitial: Bool)
}

final class EpisodesViewModel {
    var nextURL: String?
    private var isAPICallinProgress = false
    var results = [CharactersResult.SeriesCharacter]()
    
    func callThatAPI(isInitial: Bool, params: [String : String] = [:], id: String = "", completion: @escaping () -> Void) {
        if !isInitial && nextURL == nil || isAPICallinProgress {
            return
        }
        
        isAPICallinProgress = true
        
        var params: [String : String] = [:]
        if let nextURL = nextURL,
           let pageNo = nextURL.split(separator: "=").last {
            params["page"] = String(pageNo)
        }
        
    }
}
