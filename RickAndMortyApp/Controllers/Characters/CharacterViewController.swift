//
//  CharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 01/01/23.
//

import UIKit

final class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red.withAlphaComponent(1)
        title = "Character View"
        
        APIHanlder.instance.request(endpoint: .character, expecting: EpisodesResult.self) { result in
            switch result {
            case .success(let response):
                print("response is good")
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        }
    }
}
