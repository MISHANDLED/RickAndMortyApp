//
//  UICollectionViewExtension.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 16/01/23.
//

import UIKit

extension UICollectionView {
    func register(_ type: UICollectionViewCell.Type) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type, _ indexPath: IndexPath) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T
    }
}
