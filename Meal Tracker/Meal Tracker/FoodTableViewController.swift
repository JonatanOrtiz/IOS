//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Jonatan Eduardo de Araujo on 15/03/21.
//

import UIKit

class FoodTableViewController: UITableViewController {
  
  var meals: [Meal] {
    var breakfast: Meal
    var lunch: Meal
    var dinner: Meal
    breakfast = Meal(name: "breakfast", food: [])
    lunch = Meal(name: "lunch", food: [])
    dinner = Meal(name: "dinner", food: [])
    breakfast.food = [Food(name: "Pão", description: "200g"), Food(name: "Manteiga", description: "10g"), Food(name: "Ovos", description: "3 unidades")]
    lunch.food = [Food(name: "Arroz", description: "300g"), Food(name: "Feijão", description: "150g"), Food(name: "Frango", description: "200g")]
    dinner.food = [Food(name: "Arroz", description: "200g"), Food(name: "Batata doce", description: "100g"), Food(name: "Patinho", description: "200g")]
    return [breakfast, lunch, dinner]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return meals.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return meals[section].food.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
    print(meals)
    
    let food = meals[indexPath.section].food[indexPath.row]
    
    cell.textLabel?.text = food.name
    cell.detailTextLabel?.text = food.description
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let meal = meals[section]
    
    return meal.name
  }
  
}
