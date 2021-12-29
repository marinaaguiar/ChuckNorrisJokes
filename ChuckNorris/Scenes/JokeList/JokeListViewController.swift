//
//  JokeListViewController.swift
//  ChuckNorris
//
//  Created by Marina Aguiar on 23/12/2021.
//

import UIKit
import Alamofire

class JokeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    var categories: [String] = []
    var categoryImages: [String: String] = [
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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCategories()
    }
    
    func getCategories() {
        JokeAPI().fetchCategories(completion: { newCategories in
            DispatchQueue.main.async {
                self.categories = newCategories
                self.tableView.reloadData()
            }
        })
    }

}

extension JokeListViewController: UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        let category = categories[indexPath.row] 
        cell.imageView?.image = UIImage.init(systemName: categoryImages[category] ?? "")
        cell.imageView?.tintColor = UIColor(red: 0.95, green: 0.80, blue: 0.56, alpha: 1.00)

        cell.nameLabel.text = category
        return cell
    }
    
}

extension JokeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "joke") as? JokeViewController else {
            return
        }
        
        viewController.category = categories[indexPath.row]
        
        self.present(viewController, animated: true, completion: nil)
    }
    
}
