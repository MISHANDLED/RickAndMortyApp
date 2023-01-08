//
//  APIHandler.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation

final class APIHanlder {
    static let instance = APIHanlder()
    
    private init() { }
    
    func request(endpoint: URLManager, params: [String : String] = [:], id: String = "", _ completion: @escaping ((URL?) -> Void)) {
        completion(NetworkRequestBuilder(endpoint: .character).getRequest())
    }
}
