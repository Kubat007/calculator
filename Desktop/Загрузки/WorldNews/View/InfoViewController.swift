//
//  InfoViewController.swift
//  WorldNews
//
//  Created by Kubat on 31/5/21.
//

import UIKit

class InfoViewController: UIViewController {
    var news: News?
    
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var imageForInfo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        publishedAtLabel.text = news?.publishedAt
        authorLabel.text = news?.author
        descriptionLabel.text = news?.description
        url.text = news?.url
        imageForInfo.kf.setImage(with: URL(string: news?.urlToImage ?? String()))
       
    }
    @IBAction func goAction(_ sender: Any) {
        if let url = URL(string: news?.url ?? String()) {
            UIApplication.shared.open(url)
        }
    }
}
