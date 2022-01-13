//
//  JokeViewModel.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 1/5/22.
//
import Kingfisher
import Alamofire

import Foundation

class JokeViewModel: JokeViewModelProtocol {
    
    private var jokeResponse: JokeResponse?
    private var category: String?
    private weak var delegate: SearchViewDelegate?
    
    init(delegate: SearchViewDelegate?) {
        self.delegate = delegate
    }
    
    var joke: JokeResponse {
        return jokeResponse ?? JokeResponse(categories: [String](),
                                            iconURL: "",
                                            value: "",
                                            url: "")
    }
    
    func setup(_ category: String) {
        self.category = category
        getJoke(category)
    }

    func getJoke(_ category: String) {
        JokeAPI().fetchJoke(category: category) { [weak self] newJoke in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                self.jokeResponse = newJoke
                self.delegate?.didSearch(succes: true)
                print(newJoke.value!)
                }
        }
    }
}
