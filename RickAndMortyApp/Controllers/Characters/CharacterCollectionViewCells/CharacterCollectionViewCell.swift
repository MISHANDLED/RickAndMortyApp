//
//  CharacterCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 16/01/23.
//

import UIKit
import SDWebImage

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupData(imageURL: String?) {
        characterImage.sd_setImage(with: URL(string: imageURL ?? ""))
        characterImage.contentMode = .scaleAspectFill
    }
}
