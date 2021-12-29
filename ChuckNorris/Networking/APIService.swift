//
//  APIService.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 23/12/2021.
//

import Foundation
import Alamofire
import UIKit

struct APIService {
    
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct JokeAPI {
    
    private let apiService = APIService()
    
    private let basePath = "https://api.chucknorris.io/jokes/categories"
    private let jokePath = "https://api.chucknorris.io/jokes/random?category="
    
    private var jokeResponse: JokeResponse?
    private var category: String?
    
    
    
    func fetchCategories(completion: @escaping ([String]) -> Void) {
        apiService.fetchGenericData(urlString: "\(basePath)", completion: completion)
    }

    func fetchJoke(category: String, completion: @escaping (JokeResponse) -> Void) {
        apiService.fetchGenericData(urlString: jokePath + category, completion: completion)
    }

}
