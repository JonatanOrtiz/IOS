//
//  ViewController.swift
//  TestConstraints
//
//  Created by Jonatan Eduardo de Araujo on 07/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    let someRedView: UIView = {
        let someRedView = UIView()
        someRedView.backgroundColor = .red
        someRedView.alpha = 0.3
        return someRedView
    }()
    
    let someBlueView: UIView = {
        let someBlueView = UIView()
        someBlueView.backgroundColor = .blue
        someBlueView.alpha = 0.3
        return someBlueView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    lazy var shape: CAShapeLayer = {
        var shape = CAShapeLayer()
        shape.lineWidth = 15
        shape.strokeEnd = 0
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        return shape
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(shape)
        setupConstraints()
        
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        shape.path = UIBezierPath(arcCenter: view.center, radius: 25, startAngle: 0, endAngle: .pi * 2, clockwise: true).cgPath
    }
    
    func setupConstraints() {
        view.addSubview(someRedView)
        someRedView.customAnchor(centerY: (anchor: view.centerYAnchor, constant: 0), leading: (anchor: view.leadingAnchor, constant: 0), trailing: (anchor: view.trailingAnchor, constant: 0), anchorHeight: (anchor: view.heightAnchor, multiplier: 1/3, constant: 0))
        
        view.addSubview(someBlueView)
        someBlueView.customAnchor(top: (anchor: someRedView.bottomAnchor, constant: 0), leading: (anchor: view.leadingAnchor, constant: 0), trailing: (anchor: view.trailingAnchor, constant: 0), bottom: (anchor: view.bottomAnchor, constant: 0))
        
        view.addSubview(button)
        button.customAnchor(centerX: (anchor: view.centerXAnchor, constant: 0), top: (anchor: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), bottom: (anchor: view.safeAreaLayoutGuide.bottomAnchor, constant: 0), width: 200)
    }
    
    @objc func didTapButton() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        shape.add(animation, forKey: "animation")
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        if UIDevice.current.orientation.isLandscape {
//            print("Landscape")
//        } else {
//            print("Portrait")
//        }
//    }
    
}

//extension UIView {
//
//    public func removeAllConstraints() {
//        var _superview = self.superview
//
//        while let superview = _superview {
//            for constraint in superview.constraints {
//
//                if let first = constraint.firstItem as? UIView, first == self {
//                    superview.removeConstraint(constraint)
//                }
//
//                if let second = constraint.secondItem as? UIView, second == self {
//                    superview.removeConstraint(constraint)
//                }
//            }
//
//            _superview = superview.superview
//        }
//
//        self.removeConstraints(self.constraints)
//        self.translatesAutoresizingMaskIntoConstraints = true
//    }
//}
