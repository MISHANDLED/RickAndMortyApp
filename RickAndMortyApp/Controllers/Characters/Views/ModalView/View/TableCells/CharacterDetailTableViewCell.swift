//
//  CharacterDetailTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 22/01/23.
//

import UIKit

class CharacterDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var keyData: UILabel!
    @IBOutlet weak var valueData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(keyData: String, valueData: String) {
        self.keyData.text = keyData
        self.valueData.text = valueData
    }
    
}
