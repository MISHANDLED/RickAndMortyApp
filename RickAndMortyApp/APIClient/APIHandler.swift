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
    
    func request<T: Decodable>(endpoint: URLManager,
                             expecting type: T.Type,
                             params: [String : String] = [:],
                             id: String = "",
                             _ completion: @escaping ((Result<T, ErrorHandler>) -> Void)) {
        guard let url = NetworkRequestBuilder(endpoint: endpoint, params: params, id: id).getRequest(),
              let request = createRequest(from: url) else {
            completion(.failure(.InvalidURL))
            return
        }
        print("----------Start of Request----------")
        print(request)
        print("----------End of Request----------\n")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let data = data {
                print("----------Start of Response----------")
                print(data.prettyJson ?? "")
                print("----------End of Response----------\n")
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch (let error) {
                    print("Error in Parsing Endpoint:\(endpoint.description):\n\(error)")
                    completion(.failure(.ErrorInParsing(error)))
                }
                return
            }
            completion(.failure(.InternalServerError(error)))
        }
        
        task.resume()
    }
    
    private func createRequest(from url: URL) -> URLRequest? {
        var request = URLRequest(url: url, timeoutInterval: 4)
        request.httpMethod = "GET"
        return request
    }
}
