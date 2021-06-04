//
//  ViewController.swift
//  ParallaxEffectScroll
//
//  Created by Jonatan Eduardo de Araujo on 31/05/21.
//

import UIKit

struct scrollViewDataStruct {
    let title: String?
    let image: UIImage?
}

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollViewData = [scrollViewDataStruct]()
    
    var viewTagValue = 10
    var tagValue = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollViewData = [
            scrollViewDataStruct(title: "first", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-8")),
            scrollViewDataStruct(title: "second", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "third", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-6")),
            scrollViewDataStruct(title: "fourth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "fifth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-8")),
            scrollViewDataStruct(title: "sixth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "seventh", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-6")),
            scrollViewDataStruct(title: "eighth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "ninth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-8")),
            scrollViewDataStruct(title: "tenth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "eleventh", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-6")),
            scrollViewDataStruct(title: "twelfth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "thirteenth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-8")),
            scrollViewDataStruct(title: "fourteenth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5")),
            scrollViewDataStruct(title: "fifteenth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-6")),
            scrollViewDataStruct(title: "sixteenth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5"))
        ]
        
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(scrollViewData.count)
        
        for i in 0...scrollViewData.count - 1 {
            let view = CustomView(frame: CGRect(x: self.scrollView.frame.width * CGFloat(i), y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height))
            view.imageView.image = scrollViewData[i].image
            view.tag = i + viewTagValue
            self.scrollView.addSubview(view)
            
            let labelInitialPoint = scrollView.frame.width * CGFloat(i)
            
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 35), size: CGSize(width: 0, height: 40)))
            label.text = scrollViewData[i].title
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.sizeToFit()
            label.center.x = view.center.x - labelInitialPoint / 4
            label.tag = tagValue + i
            self.scrollView.addSubview(label)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView {
            for i in 0..<scrollViewData.count {
                let label = scrollView.viewWithTag(i + tagValue) as! UILabel
                let wantedLabelOffset = scrollView.contentOffset.x / 4
                    label.transform = CGAffineTransform.identity.translatedBy(x: wantedLabelOffset, y: 0.0)
            }
        }
    }
}
