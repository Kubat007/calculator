//
//  MainViewController.swift
//  WorldNews
//
//  Created by Kubat on 31/5/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    private var timer: Timer?
    let networkServise = NetworkServise ()
    var searchResponse: SearchResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupSearchBar ()
    }
    private func setupSearchBar () {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.articles.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! UserTableViewCell
        cell.news = searchResponse?.articles[indexPath.row]
        cell.setupView()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "InfoViewController")as! InfoViewController
        VC.news = searchResponse?.articles[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlString = "https://newsapi.org/v2/everything?q=\(searchText.replacingOccurrences(of: " ", with: "%20"))&from=2021-05-01sla&sortBy=publishedAt&apiKey=61e4afea171a49108c9d86cad3097530"
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
            self.networkServise.request(urlString: urlString) { [weak self] (result) in
                switch result {
                case .success(let searchResponse):
                    self?.searchResponse = searchResponse
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("error", error)
                }
            }
        })
    }
}
