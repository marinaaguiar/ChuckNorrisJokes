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
    
    var categories: [String] = []
    var categoryImages: [String: String] = [
        "animal": ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getCategoryList(completion: { newCategories in
            self.categories = newCategories
            self.tableView.reloadData()
        })
    }
    
    func getCategoryList(completion: @escaping ([String]) -> Void) {
        let categoriesEndpoint = "https://api.chucknorris.io/jokes/categories"
        
        AF.request(categoriesEndpoint).responseDecodable(of: [String].self) { categoriesResponse in
            if let categories = categoriesResponse.value {
                completion(categories)
            }
        }
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
