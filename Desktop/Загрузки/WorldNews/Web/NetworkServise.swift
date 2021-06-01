//
//  NetworkServise.swift
//  WorldNews
//
//  Created by Kubat on 31/5/21.
//

import Foundation

class NetworkServise {
    func request (urlString: String,complation: @escaping (Result<SearchResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("ошибка")
                    complation(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let news = try JSONDecoder().decode(SearchResponse.self, from: data)
                    complation(.success(news))
                    print(news)
                } catch let jsonError {
                    print("Error", jsonError)
                    complation(.failure(jsonError))
                }
            }
        }
        .resume()
    }
}
