//
//  CharacterModalPresentation.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 22/01/23.
//

import UIKit

class CharacterModalPresentation: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var mainTableView: UITableView! {
        didSet {
            mainTableView.dataSource = self
            mainTableView.delegate = self
            mainTableView.register(CharacterDetailTableViewCell.self)
        }
    }
    
    var tableData: [CharacterTableAttributes] = [] {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    var data: CharactersResult.SeriesCharacter?
    let labelData = ["Dead or Alive",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        imageView.sd_setImage(with: URL(string: data?.image ?? ""))
        characterName.text = data?.name ?? "Locked Character"
        
        var tempData = [CharacterTableAttributes]()
        
        if let dead = data?.status?.rawValue {
            tempData.append(.deadOrAlive(value: dead))
        }
        if let species = data?.species {
            tempData.append(.species(value: species))
        }
        
        if let gender = data?.gender?.rawValue {
            tempData.append(.gender(value: gender))
        }
        
        if let origin = data?.origin?.name {
            tempData.append(.originPlace(value: origin))
        }
        
        if let location = data?.location?.name {
            tempData.append(.currentLocation(value: location))
        }
        
        tableData.append(contentsOf: tempData)
    }
}

extension CharacterModalPresentation: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(CharacterDetailTableViewCell.self) {
            cell.setData(keyData: tableData[indexPath.row].description, valueData: tableData[indexPath.row].associatedValue())
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
