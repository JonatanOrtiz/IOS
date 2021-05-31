//
//  SecondViewController.swift
//  Storm Viewer
//
//  Created by Jonatan Eduardo de Araujo on 20/01/21.
//

import UIKit

let fm = FileManager.default
let path = Bundle.main.resourcePath!

class SecondVIewController: UIViewController {
    
var dataArray = [String]()
  
    var clickedCell: String?

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      if let filePath = Bundle.main.path(forResource: clickedCell, ofType: "jpg", inDirectory: "") {
        print(filePath)
        image.image = UIImage(contentsOfFile: filePath)
      }

    }
}
