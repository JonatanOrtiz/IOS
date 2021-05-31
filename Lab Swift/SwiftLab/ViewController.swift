
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtAltura: UITextField!
    @IBOutlet weak var IMCbutton: UIButton!
    
    var faixaPeso = ""
    var nomeAsset = ""

    @IBAction func easterEgg(_ sender: Any) {
        print("A foursys dá as boas vindas aos trainees de iOS!")
    }
    
    @IBAction func btnCalcularIMC(_ sender: UIButton) {
        IMCbutton.layer.borderWidth = 3.0
        IMCbutton.layer.masksToBounds = true
        IMCbutton.layer.borderColor = UIColor(red:0/255, green:0/255, blue:0/255, alpha: 1).cgColor
        if txtPeso.text == "" || txtAltura.text == "" {
                   print("Campo vazio")

                   let alerta = UIAlertController(title: "Atenção", message: "Favor preencher todos os campos", preferredStyle: .alert)
                   let acao = UIAlertAction(title: "OK", style: .default)
                   alerta.addAction(acao)
                   present(alerta, animated: true)
            return
               }
        else {}
        
        let peso = Double(txtPeso.text!.replacingOccurrences(of: ",", with: "."))!
        let altura = Double(txtAltura.text!.replacingOccurrences(of: ",", with: "."))!
        
        let imc = peso / (altura * altura)
        
        switch imc {
        case 16.00...16.99:
            faixaPeso = "Baixo Peso Grave"
            nomeAsset = "peso1.png"
        case 17.00...18.49:
            faixaPeso = "Baixo Peso"
            nomeAsset = "peso2.png"
        case 18.5...24.99:
            faixaPeso = "Normal"
            nomeAsset = "peso3.png"
        case 25.00...29.99:
            faixaPeso = "Obesidade Grau 1"
            nomeAsset = "peso4.png"
        case 30.00...39.99:
            faixaPeso = "Obesidade Grau 2"
            nomeAsset = "peso5.png"
        case 40.00...100.00:
            faixaPeso = "Obesidade Grau 3"
            nomeAsset = "peso6.png"
        default:
            faixaPeso = "peso indeterminado"
            nomeAsset = ""
        }
        print(faixaPeso, nomeAsset)
        print("IMC:  + \(imc)")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "FourSys Swift Labs"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondVC = segue.destination as! SecondVIewControllerViewController
        
        secondVC.resultadoIMC = faixaPeso
        secondVC.nomeAssetRecebido = nomeAsset
    }
    
}




