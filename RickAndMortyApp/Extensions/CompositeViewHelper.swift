//
//  CompositeViewHelper.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 16/01/23.
//

import UIKit

enum Alignment {
    case vertical
    case horizontal
}

struct CompositeViewHelper {
    
    static func itemSet (
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        spacing: CGFloat) -> NSCollectionLayoutItem {
            
            let size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
            let item = NSCollectionLayoutItem(layoutSize: size)
            item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
            
            return item
        }
    
    static func groupSet(alignment: Alignment,
                         width: NSCollectionLayoutDimension,
                         height: NSCollectionLayoutDimension,
                         items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        let size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: items)
        }
    }
    
    static func groupSet(alignment: Alignment,
                         width: NSCollectionLayoutDimension,
                         height: NSCollectionLayoutDimension,
                         items: NSCollectionLayoutItem,
                         count: Int) -> NSCollectionLayoutGroup {
        let size = NSCollectionLayoutSize(widthDimension: width, heightDimension: height)
        
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: items, count: count)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: items, count: count)
        }
    }
}

