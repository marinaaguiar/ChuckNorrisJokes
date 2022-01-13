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
    
    private lazy var viewModel: JokeViewModelProtocol = JokeViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        jokeLabel.text = viewModel.joke.value
    }
    
    func setup(category: String) {
        viewModel.setup(category)
        navigationItem.title = category
    }
}

private extension JokeViewController {
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = UIColor(red: 0.95, green: 0.80, blue: 0.56, alpha: 1.00)
    }
    
    func fill() {
        getIconJoke()
        jokeLabel.text = viewModel.joke.value
    }
    
    func getIconJoke() {
        
        if let jokeIcon = viewModel.joke.iconURL,
           let url = URL(string: jokeIcon) {
            self.imageView.kf.setImage(with: url)
        } else {
            print("error")
        }
    }
}
    
    
// MARK: - SearchViewDelegate
    
extension JokeViewController: SearchViewDelegate {
        func didSearch(succes: Bool) {
            if succes {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                    guard let self = self else { return }
                    self.fill()
                }
            }
        }
    }
