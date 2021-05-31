//
//  ImageTableViewController.swift
//  imageTableView
//
//  Created by Jonatan Eduardo de Araujo on 05/04/21.
//

import UIKit

struct Biblioteca {
  var titulo: String
  var autor: String
}

class ImageTableViewController: UITableViewController {
  
  var bibliotecas: [Biblioteca] = [
    Biblioteca(titulo: "Ein Neues Land", autor: "Shaun Tan"),
    Biblioteca(titulo: "Bosh", autor: "Laurinda Dixon"),
    Biblioteca(titulo: "Dare to Lead", autor: "Brené Brown"),
    Biblioteca(titulo: "Blasting for Optmum Health Recipe Book", autor: "NutriBullet"),
    Biblioteca(titulo: "Drinking with the Saints", autor: "Michael p. foley"),
    Biblioteca(titulo: "A Guide to Tea", autor: "Adagio Teas"),
    Biblioteca(titulo: "The Life and Complete Word of Francisco Goya", autor: "P. Gassier & J Wilson"),
    Biblioteca(titulo: "Lady Cottington's Presse Fair book", autor: "Lady Cottington"),
    Biblioteca(titulo: "How to Draw Cats", autor: "Janet Rancan"),
    Biblioteca(titulo: "Drawing People", autor: "Barbara Bradley"),
    Biblioteca(titulo: "What to Say When You Talk to Yourself", autor: "Shad Helmstetter")
  ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
//    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
//        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//            // Editing Emoji
//            let emojiToEdit = bibliotecas[indexPath.row]
//            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
//        } else {
//            // Adding Emoji
//            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
//        }
//    }
//
//    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
//        guard segue.identifier == "saveUnwind",
//            let sourceViewController = segue.source as? AddEditEmojiTableViewController,
//            let emoji = sourceViewController.emoji else { return }
//
//        if let selectedIndexPath = tableView.indexPathForSelectedRow {
//            bibliotecas[selectedIndexPath.row] = emoji
//            tableView.reloadRows(at: [selectedIndexPath], with: .none)
//        } else {
//            let newIndexPath = IndexPath(row: emojis.count, section: 0)
//          bibliotecas.append(emoji)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
//    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bibliotecas.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BibliotecaTableViewCell

        //Step 2: Fetch model object to display
        let biblioteca = bibliotecas[indexPath.row]

        //Step 3: Configure cell
        cell.update(with: biblioteca)
        cell.showsReorderControl = true

        //Step 4: Return cell
        return cell
    }

//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//          bibliotecas.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }

//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        let movedEmoji = emojis.remove(at: fromIndexPath.row)
//        emojis.insert(movedEmoji, at: to.row)
//    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
  
}
