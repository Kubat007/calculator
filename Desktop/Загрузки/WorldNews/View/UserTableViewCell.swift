//
//  UserTableViewCell.swift
//  WorldNews
//
//  Created by Kubat on 31/5/21.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var news: News?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupView() {
        titleLabel.text = news?.title
        nameLabel.text = news?.author
        publishedAt.text = news?.publishedAt
        showImage.kf.setImage(with: URL(string: news?.urlToImage ?? String ()))
        
    }
}
