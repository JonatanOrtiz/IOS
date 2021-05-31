//
//  ViewController.swift
//  TableViewViewCode
//
//  Created by Jonatan Eduardo de Araujo on 24/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  private var table = UITableView()
  private var data = ["Alberto","Júlio","Carla","Maria","Jonas"]
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.textLabel?.text = data[indexPath.row]
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    table.dataSource = self
    table.delegate = self
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    view.addSubview(table)
    
    table.tableFooterView = UIView()
    
    table.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      table.topAnchor.constraint(equalTo: view.topAnchor),
      table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      table.leftAnchor.constraint(equalTo: view.leftAnchor),
      table.rightAnchor.constraint(equalTo: view.rightAnchor),
    ])
  }

}
