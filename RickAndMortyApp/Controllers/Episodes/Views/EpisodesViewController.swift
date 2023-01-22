//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by Devansh Mohata on 01/01/23.
//

import UIKit

final class EpisodesViewController: UIViewController {
    
    var nextURL: String?
    var results = [EpisodesResult.SeriesEpisode]() {
        didSet {
            errorView.isHidden = true
            mainTableView.removeTableFooter()
            mainTableView.reloadData()
        }
    }
    private var isAPICallinProgress = false
    
    @IBOutlet weak var mainTableView: UITableView! {
        didSet {
            mainTableView.dataSource = self
            mainTableView.delegate = self
            mainTableView.separatorStyle = .none
            mainTableView.register(EpisodeTableViewCell.self)
        }
    }
    
    @IBOutlet weak var errorView: UIView! {
        didSet {
            errorView.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode View"
        errorView.isHidden = false
        getData(isInitial: true)
    }
    
    //MARK: API CALL
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
        mainTableView.addTableFooter()
        
        APIHanlder.instance.request(endpoint: .episode, expecting: EpisodesResult.self, params: params) {[weak self] result in
            switch result {
            case .success(let response):
                self?.nextURL = response.info?.next
                if let temp = response.results {
                    self?.results.append(contentsOf: temp)
                }
            case .failure(_):
                if !isInitial {
                    self?.mainTableView.removeTableFooter()
                }
            }
            self?.isAPICallinProgress = false
        }
    }
}

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(EpisodeTableViewCell.self) {
            let data = results[indexPath.row]
            cell.setData(episodeAnnotation: data.episodeAnn, episodeAirDate: data.airDate, episodeName: data.episodeName)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == results.count - 1 {
            getData()
        }
    }
}
