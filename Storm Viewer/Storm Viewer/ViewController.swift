//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Jonatan Eduardo de Araujo on 20/01/21.
//

import UIKit

class ViewController: UITableViewController {
  
  
  let fm = FileManager.default
  let path = Bundle.main.resourcePath!
  var dataArray = [String]()
  var clickedCell = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    do {
      let items = try fm.contentsOfDirectory(atPath: path)
      
      for item in items {
        if item.hasSuffix("jpg") {
          dataArray.append(String(item.dropLast(4)))
        }
      }
      dataArray.sort()
    } catch {
      print(error)
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return dataArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = dataArray[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    clickedCell = dataArray[indexPath.row]
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let secondVC = segue.destination as! SecondVIewController
    
    secondVC.clickedCell = clickedCell
    
  }
}

