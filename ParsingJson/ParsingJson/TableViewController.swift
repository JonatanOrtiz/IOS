//
//  TableViewController.swift
//  ParsingJson
//
//  Created by Carlos Alberto Savi on 09/03/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var characters = [JSONModelElement]()
    let activityView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        setupJsonAPI()
        
        activityView.center = self.view.center
        activityView.color = UIColor.red
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
        setupJsonLocal()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "JsonTableViewCell", for: indexPath) as! TableViewCell
        
        let character = characters[indexPath.row]

        if let url = URL(string: character.imageUrl!) {
            if let data = try? Data(contentsOf: url) {
                cell.imageUrl.image = UIImage(data: data)
            }
        }
        cell.labelFullName.text = character.fullName
        cell.labelFamily.text = character.family
        
        return cell

    }
    
    /// My Funtions
    func setupJsonAPI() {
        
        // 1. Usando API
        let url = URL(string: "https://thronesapi.com/api/v2/Characters")!
        
        guard let jsonData = try? Data(contentsOf: url) else { return }
        
        characters = try! JSONDecoder().decode([JSONModelElement].self, from: jsonData)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activityView.stopAnimating()
        }
    }
    
    func setupJsonLocal() {
        
        // 2. Usando Arquivo Json Local
        if let url = Bundle.main.url(forResource: "Dados", withExtension: "json") {
            
            guard let jsonData = try? Data(contentsOf: url) else { return }
            characters = try! JSONDecoder().decode([JSONModelElement].self, from: jsonData)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityView.stopAnimating()
            }
        }

    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
