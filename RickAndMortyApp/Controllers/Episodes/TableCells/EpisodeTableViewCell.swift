//
//  EpisodeTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 15/01/23.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeAnnotation: UILabel!
    @IBOutlet weak var episodeAirDate: UILabel!
    @IBOutlet weak var episodeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData( episodeAnnotation: String?,
                  episodeAirDate: String?,
                  episodeName: String?) {
        self.episodeAnnotation.text = episodeAnnotation ?? "S00E00"
        self.episodeAirDate.text = episodeAirDate ?? "\(Date())"
        self.episodeName.text = episodeName ?? "Pilot"
    }
    
}
