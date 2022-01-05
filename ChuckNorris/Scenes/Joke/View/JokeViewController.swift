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

    
//    private var jokeResponse: JokeResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        JokeAPI().fetchJoke(category: category) { [weak self] newJoke in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                self.jokeLabel.text = newJoke.value
                
                if let url = URL(string: newJoke.iconURL) {
                    self.imageView.kf.setImage(with: url)
                } else {
                    print("error")
                }
            }
        }
    }


}

