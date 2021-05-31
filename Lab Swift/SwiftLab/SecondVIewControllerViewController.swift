//
//  SecondVIewControllerViewController.swift
//  SwiftLab
//
//  Created by Jonatan Eduardo de Araujo on 18/01/21.
//

import UIKit

class SecondVIewControllerViewController: UIViewController {
    
    var resultadoIMC: String?
    var nomeAssetRecebido: String?

    @IBOutlet weak var lblFaixaPeso: UILabel!
    @IBOutlet weak var imageSilhueta: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblFaixaPeso.text = resultadoIMC
        imageSilhueta.image = UIImage(named: nomeAssetRecebido!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
