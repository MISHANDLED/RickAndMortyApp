//
//  ArrayExtension.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 22/01/23.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
    }
}
