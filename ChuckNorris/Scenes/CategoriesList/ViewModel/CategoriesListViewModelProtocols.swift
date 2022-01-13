//
//  JokeListViewModelProtocols.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 12/29/21.
//

import Foundation
import UIKit

protocol CategoriesListViewModelProtocol: AnyObject {
    
    func getCategories()
    func numberOfSections() -> Int
    func numberOfRows() -> Int
    func categoryCell(_ index: Int) -> CategoryCell
    func iconImage(category: String) -> UIImage?
    func transporter(index: Int) -> String
    func showJoke(category: String)
    
}

protocol CategoriesViewModelDelegate: AnyObject {
    func didLoad()
    func didLoadWithError()
    func displayCategory(_ category: String)
}

