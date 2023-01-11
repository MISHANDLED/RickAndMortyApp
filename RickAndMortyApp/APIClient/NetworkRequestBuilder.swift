//
//  NetworkRequestBuilder.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 08/01/23.
//

import Foundation

class NetworkRequestBuilder {
    private let base_transport_method = "https"
    private let base_url = "rickandmortyapi.com/api"
    private let endpoint: URLManager
    private let params: [String : String]
    private let id: String
    
    //TODO: Make Function to make request
    private lazy var urlRequest: String = {
        var url = "\(base_transport_method)://\(base_url)/\(endpoint.description)"
        
        if !id.isEmpty { url += "/\(id)" }
        
        if !params.isEmpty {
            url.append("?")
            let queryParams = params.compactMap { key, value in
                return "\(key)=\(value)"
            }.joined(separator: "&")
            url.append(queryParams)
        }

        return url
    }()
    
    init(endpoint: URLManager, params: [String : String] = [:], id: String = "") {
        self.endpoint = endpoint
        self.params = params
        self.id = id
    }
    
    func getRequest() -> URL? {
        switch endpoint {
        case .character:
            return URL(string: urlRequest)
        case .location:
            return URL(string: urlRequest)
        case .episode:
            return URL(string: urlRequest)
        }
    }
}
