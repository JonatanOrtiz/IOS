//
//  bibliotecaTableViewCell.swift
//  imageTableView
//
//  Created by Jonatan Eduardo de Araujo on 05/04/21.
//

import UIKit

class BibliotecaTableViewCell: UITableViewCell {

  
  @IBOutlet weak var imageCell: UIImageView!
  @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with biblioteca: Biblioteca) {
      imageCell.image = UIImage(named: biblioteca.titulo)
        nameLabel.text = biblioteca.titulo
        descriptionLabel.text = biblioteca.autor
    }

}
