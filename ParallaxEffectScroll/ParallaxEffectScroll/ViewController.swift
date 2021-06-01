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
            scrollViewDataStruct(title: "fourth", image: #imageLiteral(resourceName: "Fundo-Teams-modelo-5"))
        ]
        
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(scrollViewData.count)
        var i = 0
        for data in scrollViewData {
            let view = CustomView(frame: CGRect(x: self.scrollView.frame.width * CGFloat(i), y: 80, width: self.scrollView.frame.width, height: self.scrollView.frame.height - 90))
            view.imageView.image = data.image
            view.tag = i + viewTagValue
            self.scrollView.addSubview(view)
            
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 35), size: CGSize(width: 0, height: 40)))
            label.text = data.title
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.sizeToFit()
            label.center.x = (i == 0) ? view.center.x : view.center.x - self.scrollView.frame.width / 2
            label.tag = tagValue + i
            self.scrollView.addSubview(label)
            
            i += 1
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView {
            for i in 0..<scrollViewData.count {
                let label = scrollView.viewWithTag(i + tagValue) as! UILabel
                let view = scrollView.viewWithTag(i + viewTagValue) as! CustomView
                let scrollContentOffset = scrollView.contentOffset.x + self.scrollView.frame.width
                let viewOffset = (view.center.x - scrollView.bounds.width / 4) - scrollContentOffset
                label.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset) / 2)
            }
        }
    }
}
