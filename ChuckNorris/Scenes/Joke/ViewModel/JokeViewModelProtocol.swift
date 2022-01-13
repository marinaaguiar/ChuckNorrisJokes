//
//  JokeViewModelProtocol.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 1/5/22.
//

import Foundation

protocol JokeViewModelProtocol: AnyObject {
    
    var joke: JokeResponse { get }
    func setup(_ cateogry: String)
    func getJoke(_ category: String)
}

protocol SearchViewDelegate: AnyObject {
    func didSearch(succes: Bool)
}
