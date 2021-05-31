import UIKit

class BibliotecaTableViewController: UITableViewController {
  
  var tituloSegundaTela = ""
  var autorSegundaTela = ""
  
  var bibliotecas: [Biblioteca] = [
    Biblioteca(titulo: "Ein Neues Land", autor: "Shaun Tan"),
    Biblioteca(titulo: "Bosch", autor: "Laurinda Dixon"),
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
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let segundaTela = storyboard?.instantiateViewController(identifier: "Detalhes") as? Detalhes
    self.navigationController?.pushViewController(segundaTela!, animated: true)
    
    segundaTela?.tituloSegundaTela = bibliotecas[indexPath.row].titulo
    segundaTela?.autorSegundaTela = bibliotecas[indexPath.row].autor
    
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //Step 1: Dequeue cell
    let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! BibliotecaTableViewCell
    
    //Step 2: Fetch model object to display
    let emoji = bibliotecas[indexPath.row]
    
    //Step 3: Configure cell
    cell.update(with: emoji)
    cell.showsReorderControl = true
    
    //Step 4: Return cell
    return cell
  }
  
  
  
}
