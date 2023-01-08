//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 01/01/23.
//

import UIKit

final class EpisodesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red.withAlphaComponent(1)
        title = "Episode View"
        APIHanlder.instance.request(endpoint: .character) { url in
            print(url)
        }
    }
    
}
