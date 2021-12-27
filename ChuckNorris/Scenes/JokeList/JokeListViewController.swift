//
//  JokeListViewController.swift
//  ChuckNorris
//
//  Created by Bernardo Alecrim on 23/12/2021.
//

import UIKit
import Alamofire

class JokeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Fill the dictionary with the icons and categories
    
    var categories: [String] = []
    var categoryImages: [String: String] = [
        "animal": ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getCategories()
    }
    
    func getCategories() {
        APIService().fetchCategories(completion: { newCategories in
            self.categories = newCategories
            self.tableView.reloadData()
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
        
        cell.nameLabel.text = categories[indexPath.row]
        
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
