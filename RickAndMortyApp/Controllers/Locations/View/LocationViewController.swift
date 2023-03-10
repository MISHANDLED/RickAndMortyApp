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
        title = "Location View"
        
        APIHanlder.instance.request(endpoint: .location, expecting: EpisodesResult.self) { result in
            switch result {
            case .success(_):
                print("response is good")
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        }
        
    }
    
}
