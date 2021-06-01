//
//  TableViewController.swift
//  GithubApiApp
//
//  Created by Jonatan Eduardo de Araujo on 27/05/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var repos = [Repo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(repos)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return repos.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let repo = repos[indexPath.row]
        
        cell.update(with: repo)
        cell.showsReorderControl = true
        
        return cell
    }
    
}
