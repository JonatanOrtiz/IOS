
import UIKit
import PlaygroundSupport

final class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .green
        
        //         Create and set Image View
        let imageView = UIImageView(frame: CGRect(x:90, y:200, width:200, height:200))
        //        imageView.center = self.view.center
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(imageView)
        
        typealias JSONModel = [JSONModelElement]
        
        // 1. Usando API
//        let url = URL(string: "https://thronesapi.com/api/v2/Characters")!
//        let jsonData = try! Data(contentsOf: url)
//        if let jsonModel = try? JSONDecoder().decode(JSONModel.self, from: jsonData) {
//            for element in jsonModel {
//                print("Id: \(element.id ?? 0)")
//                print("First Name: \(element.firstName ?? "")")
//                print("Last name: \(element.lastName ?? "")")
//                print("Full Name: \(element.lastName ?? "")")
//                print("Title: \(element.fullName ?? "")")
//                print("Family: \(element.family ?? "")")
//                print("Image: \(element.imageUrl ?? "")\n")
//                
//                guard let imageUrl:URL = URL(string: element.imageUrl!) else {
//                    return
//                }
//                
//                imageView.loadImage(withUrl: imageUrl)
//                
//                self.view = view
//                
//            }
//        }
        
        // 2. Usando arquivo JSON local
        if let url = Bundle.main.url(forResource: "Dados", withExtension: "json") {
            let jsonData = try! Data(contentsOf: url)
            if let jsonModel = try? JSONDecoder().decode(JSONModel.self, from: jsonData) {
                for element in jsonModel {
                    print("Id: \(element.id ?? 0)")
                    print("First Name: \(element.firstName ?? "")")
                    print("Last name: \(element.lastName ?? "")")
                    print("Full Name: \(element.lastName ?? "")")
                    print("Title: \(element.fullName ?? "")")
                    print("Family: \(element.family ?? "")")
                    print("Image: \(element.imageUrl ?? "")\n")
                    
                    guard let imageUrl:URL = URL(string: element.imageUrl!) else {
                        return
                    }
                    
                    imageView.loadImage(withUrl: imageUrl)
                    
                    self.view = view
                }
            }
        }
    }
}

extension UIImageView {
    func loadImage(withUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = MyViewController()
