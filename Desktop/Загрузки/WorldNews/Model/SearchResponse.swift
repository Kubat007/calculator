//
//  SearchResponse.swift
//  WorldNews
//
//  Created by Kubat on 31/5/21.
//

import UIKit
import Foundation

struct SearchResponse: Decodable {
    
    var status: String?
    var totalResults: Int?
    var articles: [News]
}

class News: Decodable {
    
    var name: String?
    var author: String?
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    var url: String?
}


