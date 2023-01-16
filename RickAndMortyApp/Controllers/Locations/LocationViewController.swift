//
//  LocationViewController.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 01/01/23.
//

import UIKit

final class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red.withAlphaComponent(1)
        title = "Location View"
        
        APIHanlder.instance.request(endpoint: .location, expecting: EpisodesResult.self) { result in
            switch result {
            case .success(let response):
                print("response is good")
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        }
        
    }
    
}
