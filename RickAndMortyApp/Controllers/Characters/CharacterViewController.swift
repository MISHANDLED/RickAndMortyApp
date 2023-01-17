//
//  CharacterViewController.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 01/01/23.
//

import UIKit

final class CharacterViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView! {
        didSet {
            mainCollectionView.dataSource = self
            mainCollectionView.delegate = self
            mainCollectionView.collectionViewLayout = createLayout()
            mainCollectionView.register(CharacterCollectionViewCell.self)
        }
    }
    
    var nextURL: String?
    var results = [CharactersResult.SeriesCharacter]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.mainCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red.withAlphaComponent(1)
        title = "Character View"
        getData(isInitial: true)
    }
    
    private func getData(isInitial: Bool = false) {
        if !isInitial && nextURL == nil {
            return
        }
        
        var params: [String : String] = [:]
        if let nextURL = nextURL,
           let pageNo = nextURL.split(separator: "=").last {
            params["page"] = String(pageNo)
        }
        
        APIHanlder.instance.request(endpoint: .character, expecting: CharactersResult.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.nextURL = response.info?.next
                if let temp = response.results {
                    self?.results.append(contentsOf: temp)
                }
            case .failure(let error):
                print("Something went wrong \(error)")
            }
        }
    }
}

extension CharacterViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(CharacterCollectionViewCell.self, indexPath) {
            let data = results[indexPath.row]
            cell.setupData(imageURL: data.image, name: data.name)
            cell.backgroundColor = .red
            return cell
        }
        return UICollectionViewCell()
    }
}

extension CharacterViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositeViewHelper.itemSet(width: .fractionalWidth(1),
                                               height: .estimated(400),
                                               spacing: 0)
        
        let group = CompositeViewHelper.groupSet(alignment: .horizontal,
                                                 width: .fractionalWidth(0.5),
                                                 height: .fractionalHeight(1),
                                                 items: [item])
        
        let section = NSCollectionLayoutSection(group: group)
    
        return UICollectionViewCompositionalLayout(section: section)
    }
}
