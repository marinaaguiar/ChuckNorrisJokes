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
            
    let categoriesUrl = "https://api.chucknorris.io/jokes/categories"
    let jokePath = "https://api.chucknorris.io/jokes/random?category="
    
    func fetchCategories(completion: @escaping ([String]) -> Void) {
        AF.request(categoriesUrl).responseDecodable(of: [String].self) { categoriesResponse in
            if let categories = categoriesResponse.value {
                completion(categories)
            }
        }
    }
    
    func fetchJoke(category: String, completion: @escaping (JokeResponse) -> Void) {
        AF.request("\(jokePath)\(category)").responseDecodable(of: JokeResponse.self) { jokeResponse in
            if let joke = jokeResponse.value {
                completion(joke)
            }
        }
    }
}
