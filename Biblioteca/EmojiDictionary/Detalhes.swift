//
//  Detalhes.swift
//  EmojiDictionary
//
//  Created by Jonatan Eduardo de Araujo on 05/04/21.
//

import UIKit

class Detalhes: UIViewController {
  
  @IBOutlet weak var titulo: UILabel!
  @IBOutlet weak var autor: UILabel!
  @IBOutlet weak var imagem: UIImageView!
  
  var tituloSegundaTela = ""
  var autorSegundaTela = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imagem.image = UIImage(named: tituloSegundaTela)
    titulo.text = tituloSegundaTela
    autor.text = autorSegundaTela
    
  }
  
}
