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
            mainCollectionView.reloadData()
        }
    }
    
    private var isAPICallinProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character View"
        getData(isInitial: true)
    }
    
    private func getData(isInitial: Bool = false) {
        if !isInitial && nextURL == nil || isAPICallinProgress {
            return
        }
        
        isAPICallinProgress = true
        
        var params: [String : String] = [:]
        if let nextURL = nextURL,
           let pageNo = nextURL.split(separator: "=").last {
            params["page"] = String(pageNo)
        }
        
        APIHanlder.instance.request(endpoint: .character, expecting: CharactersResult.self, params: params) { [weak self] result in
            switch result {
            case .success(let response):
                self?.nextURL = response.info?.next
                if let temp = response.results {
                    self?.results.append(contentsOf: temp)
                }
            case .failure(let error):
                print("Something went wrong \(error)")
            }
            self?.isAPICallinProgress = false
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
            cell.setupData(imageURL: data.image)
            cell.backgroundColor = .red
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = results[safe: indexPath.row],
           let vc = UIStoryboard(name: "CharacterModalPresentationStoryboard", bundle: nil).instantiateViewController(withIdentifier: "CharacterModalPresentationStoryboard") as? CharacterModalPresentation {
            vc.data = data
            self.navigationController?.present(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == results.count - 1 {
            getData()
        }
    }
}

extension CharacterViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositeViewHelper.itemSet(width: .fractionalWidth(1),
                                               height: .fractionalHeight(1),
                                               spacing: 0)
        
        let group = CompositeViewHelper.groupSet(alignment: .horizontal,
                                                 width: .fractionalWidth(1),
                                                 height: .fractionalHeight(1/3),
                                                 items: item,
                                                 count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
    
        return UICollectionViewCompositionalLayout(section: section)
    }
}
