//
//  ViewController.swift
//  TestConstraints
//
//  Created by Jonatan Eduardo de Araujo on 07/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var animationControl = false
    
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
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.text = "\(count.description)%"
        label.textColor = .white
        label.alpha = 0.5
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.lineBreakMode = .byCharWrapping
        return label
    }()

    lazy var shape: CAShapeLayer = {
        var shape = CAShapeLayer()
        shape.lineWidth = 15
        shape.strokeEnd = 0
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        return shape
    }()
    
    lazy var trackShape: CAShapeLayer = {
        var trackShape = CAShapeLayer()
        trackShape.lineWidth = 15
        trackShape.strokeColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        trackShape.fillColor = UIColor.clear.cgColor
        return trackShape
    }()
    
    var count = 0
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(someRedView)
        view.addSubview(someBlueView)
        view.addSubview(button)
        view.layer.addSublayer(trackShape)
        view.layer.addSublayer(shape)
        view.addSubview(label)
        setupConstraints()
        
    }
    
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        shape.path = UIBezierPath(
            arcCenter: view.center,
            radius: 50,
            startAngle: -(.pi / 2),
            endAngle: .pi * 2,
            clockwise: true
        ).cgPath
        trackShape.path = shape.path

    }
    
    func setupConstraints() {
        view.removeAllConstraints()
        
        label.customAnchor(
            centerX: (anchor: view.centerXAnchor, constant: 0),
            centerY: (anchor: view.centerYAnchor, constant: 0)
        )
        someRedView.customAnchor(
            centerY: (anchor: view.centerYAnchor, constant: 0),
            leading: (anchor: view.leadingAnchor, constant: 0),
            trailing: (anchor: view.trailingAnchor, constant: 0),
            anchorHeight: (anchor: view.heightAnchor, multiplier: 1/3, constant: 0)
        )
        someBlueView.customAnchor(
            top: (anchor: someRedView.bottomAnchor, constant: 0),
            leading: (anchor: view.leadingAnchor, constant: 0),
            trailing: (anchor: view.trailingAnchor, constant: 0),
            bottom: (anchor: view.bottomAnchor, constant: 0)
        )
        button.customAnchor(
            centerX: (anchor: view.centerXAnchor, constant: 0),
            bottom: (anchor: view.bottomAnchor, constant: 40),
            width: 200,
            height: 50
        )
        
        view.updateConstraints()
    }
    
    func changeConstraints() {
        var notchSpace: CGFloat = 0
        
        if UIDevice.current.hasNotch {
            notchSpace = 50
        }
        
        view.removeAllConstraints()
        
        label.customAnchor(
            centerX: (anchor: view.centerXAnchor, constant: 0),
            centerY: (anchor: view.centerYAnchor, constant: 0)
        )
        someRedView.customAnchor(
            top: (anchor: view.topAnchor, constant: 0),
            leading: (anchor: view.leadingAnchor, constant: 0),
            trailing: (anchor: view.trailingAnchor, constant: 0),
            anchorHeight: (anchor: view.heightAnchor, multiplier: 1/3, constant: 0)
        )
        someBlueView.customAnchor(
            top: (anchor: someRedView.bottomAnchor, constant: 0),
            leading: (anchor: view.leadingAnchor, constant: 0),
            trailing: (anchor: view.trailingAnchor, constant: 0),
            anchorHeight: (anchor: view.heightAnchor, multiplier: 1/3, constant: 0)
        )
        button.customAnchor(
            centerX: (anchor: view.centerXAnchor, constant: 0),
            top: (anchor: view.topAnchor, constant: notchSpace),
            width: 200,
            height: 50
        )
        
        view.updateConstraints()
    }
    
    @objc func timerCounter() {
        label.text = "\(count.description)%"
        label.alpha = CGFloat(Double(count)/100.00 + 0.15)
        self.view.layoutIfNeeded()
        shape.strokeColor = CGColor(red: CGFloat(Double.random(in: 0...1)), green: CGFloat(Double.random(in: 0...1)), blue: CGFloat(Double.random(in: 0...1)), alpha: 1)
        count += 1
    }
    
    @objc func didTapButton() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        timer?.fire()
        animationControl.toggle()
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 12.5
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        
        animationControl == true ? changeConstraints() : setupConstraints()
        
        UIView.animate(withDuration: 10, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.timer?.invalidate()
            self.count = 0
        })
    }
    
}
