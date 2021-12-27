//
//  APIService.swift
//  ChuckNorris
//
//  Created by Bernardo Alecrim on 23/12/2021.
//

import Foundation
import Alamofire
import UIKit


struct APIService {
    
    var category: String = ""
        
    let categoriesUrl = "https://api.chucknorris.io/jokes/categories"
    let jokeUrl = "https://api.chucknorris.io/jokes/random?category=" + category
    
    func fetchCategories(completion: @escaping ([String]) -> Void) {
        AF.request(categoriesUrl).responseDecodable(of: [String].self) { categoriesResponse in
            if let categories = categoriesResponse.value {
                completion(categories)
            }
        }
    }
    
    func fetchJoke(completion: @escaping (JokeResponse) -> Void) {
        AF.request(jokeUrl).responseDecodable(of: JokeResponse.self) { jokeResponse in
            if let joke = jokeResponse.value {
                completion(joke)
            }
        }
    }
}
