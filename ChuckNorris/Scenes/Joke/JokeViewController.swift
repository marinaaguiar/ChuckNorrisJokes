//
//  JokeViewController.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 23/12/2021.
//

import UIKit
import Alamofire
import Kingfisher

class JokeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var jokeLabel: UILabel!
    
    var category: String = ""
    
    private var jokeResponse: JokeResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeLabel.text = ""
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getJoke(category)
    }
   
    func setup(_ category: String) {
        self.category = category
        getJoke(category)
    }

    func getJoke(_ category: String) {
        APIService().fetchJoke(category: category) { [weak self] newJoke in
            guard let self = self else { return }
            
            self.jokeLabel.text = newJoke.value
            
            if let url = URL(string: newJoke.iconURL) {
                self.imageView.kf.setImage(with: url)
            } else {
                print("error")
            }
        }
    }
    

    

    
//    func getJoke(from: category) {
//        APIService().fetchJoke(completion: { newJoke in
//            self.jokeLabel.text = newJoke.value
//        })
//    }
}

