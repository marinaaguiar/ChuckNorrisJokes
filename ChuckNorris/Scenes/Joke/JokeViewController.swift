//
//  JokeViewController.swift
//  ChuckNorris
//
//  Created by Bernardo Alecrim on 23/12/2021.
//

import UIKit
import Alamofire

class JokeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var jokeLabel: UILabel!
    
    var category: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getJoke(from: category) { joke in
            self.jokeLabel.text = joke.value
        }
    }
    
    // Problem: The business logic is mixed with the ViewController, which might cause organizational problems such as code duplication, inability to refactor easily, reusebility
    // Proposed Solution: Move the function that fetch the data from API to a separate Type

    
    func getJoke(from category: String, completion: @escaping (JokeResponse) -> Void) {
        let jokeEndpoint = "https://api.chucknorris.io/jokes/random?category=" + category
        
        AF.request(jokeEndpoint).responseDecodable(of: JokeResponse.self) { jokeResponse in
            if let joke = jokeResponse.value {
                completion(joke)
            }
        }
    }

}

