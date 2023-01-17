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
    @IBOutlet weak var characterName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupData(imageURL: String?, name: String?) {
        characterImage.sd_setImage(with: URL(string: imageURL ?? ""))
        characterName.text = name ?? "Locked Character"
    }
}
