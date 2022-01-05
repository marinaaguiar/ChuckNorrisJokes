//
//  JokeViewModel.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 12/29/21.
//

import Foundation
import UIKit
import Alamofire

class CategoriesListViewModel: CategoriesListViewModelProtocol {
    
    private var categories: [String] = []
    
    private weak var delegate: CategoriesViewModelDelegate?
    
    private var categoryImages: [String: String] = [
        "animal": "tortoise",
        "career": "case",
        "celebrity": "star",
        "dev": "terminal",
        "explicit": "exclamationmark.bubble",
        "fashion": "bag",
        "food": "applelogo",
        "history": "book.closed",
        "money": "dollarsign.circle",
        "movie": "film",
        "music": "music.note",
        "political": "globe",
        "religion": "burst",
        "science": "lightbulb",
        "sport": "sportscourt",
        "travel": "airplane"
    ]

    init(delegate: CategoriesViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func getCategories() {
//        JokeAPI().fetchCategories(completion: { newCategories in
//            DispatchQueue.main.async {
//                self.categories = newCategories
//                tableView.reloadData()
//            }
//        })
        
        JokeAPI().fetchCategories{ [weak self] newCategories in
            guard let self = self else {
                self?.delegate?.didLoadWithError()
                return
            }
            self.categories = newCategories
            self.delegate?.didLoad()
            return
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return categories.count
    }
    
    func categoryCell(_ index: Int) -> CategoryCell {
        let categoryTitle = categories[index]
        
        return CategoryCell(title: categoryTitle)
    }
    
    func iconImage(category: String) -> UIImage? {
        guard let imageName = categoryImages[category],
              let iconImage = UIImage(systemName: imageName) else {
              return nil
          }
        return iconImage
    }
    
    func transporter(index: Int) -> String {
        categories[index]
    }
    
    func showJoke(category: String) {
        delegate?.displayCategory(category)
    }

}
