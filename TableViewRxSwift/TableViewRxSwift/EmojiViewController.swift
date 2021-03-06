//
//  EmojiTableViewController.swift
//  TableViewRxSwift
//
//  Created by Jonatan Eduardo de Araujo on 05/04/21.
//

import UIKit
import RxSwift
import RxCocoa

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
}

class EmojiViewController: ViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  
  private var disposeBag = DisposeBag()
  
  var emojisArray: [Emoji] = [
     Emoji(symbol: "π", name: "Grinning Face",
     description: "A typical smiley face.", usage: "happiness"),
     Emoji(symbol: "π", name: "Confused Face",
     description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
     Emoji(symbol: "π", name: "Heart Eyes",
     description: "A smiley face with hearts for eyes.",
     usage: "love of something; attractive"),
     Emoji(symbol: "π§βπ»", name: "Developer",
     description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
     Emoji(symbol: "π’", name: "Turtle", description:
     "A cute turtle.", usage: "something slow"),
     Emoji(symbol: "π", name: "Elephant", description:
     "A gray elephant.", usage: "good memory"),
     Emoji(symbol: "π", name: "Spaghetti",
     description: "A plate of spaghetti.", usage: "spaghetti"),
     Emoji(symbol: "π²", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
     Emoji(symbol: "βΊοΈ", name: "Tent", description: "A small tent.", usage: "camping"),
     Emoji(symbol: "π", name: "Stack of Books",
     description: "Three colored books stacked on each other.",
     usage: "homework, studying"),
     Emoji(symbol: "π", name: "Broken Heart",
     description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "π€", name: "Snore",
     description:
     "Three blue \'z\'s.", usage: "tired, sleepiness"),
     Emoji(symbol: "π", name: "Checkered Flag",
     description: "A black-and-white checkered flag.", usage:
     "completion")
  ]

    override func viewDidLoad() {
        super.viewDidLoad()
      bindTableView()
    }
  
  
  func bindTableView() {
    let emojis = Observable.from([emojisArray])
    
    emojis.bind(to: tableView.rx.items) {
      (tableView: UITableView, index: Int, element: Emoji) in
      let cell = UITableViewCell(style: .subtitle,
     reuseIdentifier: "cell")
      cell.textLabel?.text = "\(element.symbol) - \(element.name)"
      cell.detailTextLabel?.text = element.description
      return cell
      }
      .disposed(by: disposeBag)
  }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

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
