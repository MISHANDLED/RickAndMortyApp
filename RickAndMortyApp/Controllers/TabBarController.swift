//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 01/01/23.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabView()
    }
    
    private func setupTabView() {
        var tabs = [UINavigationController]()
        for view in viewControllerMaker.allCases { tabs.append(view.createVC()) }
        setViewControllers(tabs, animated: true)
    }
    
    private enum viewControllerMaker: Int, CaseIterable {
        case characters
        case locations
        case episodes
        
        var title: String {
            switch self {
            case .characters:
                return "Characters"
            case .locations:
                return "Locations"
            case .episodes:
                return "Episodes"
            }
        }
        
        var imageName: String {
            switch self {
            case .characters:
                return "shared.with.you"
            case .locations:
                return "location.fill.viewfinder"
            case .episodes:
                return "books.vertical.fill"
            }
        }
        
        var vc: UIViewController {
            switch self {
            case .characters:
                return CharacterViewController()
            case .locations:
                return LocationViewController()
            case .episodes:
                return EpisodesViewController()
            }
        }
        
        func createVC() -> UINavigationController {
            let navVc = UINavigationController(rootViewController: self.vc)
            navVc.navigationBar.prefersLargeTitles = true
            navVc.tabBarItem = .init(title: self.title, image: UIImage(systemName: self.imageName), tag: self.rawValue)
            navVc.navigationItem.largeTitleDisplayMode = .automatic
            return navVc
        }
    }
}

