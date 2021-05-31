//
//  ViewController.swift
//  PhotoFrameViewCode
//
//  Created by Jonatan Eduardo de Araujo on 23/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  let imageView: UIImageView = {
    let someImage = UIImageView()
    someImage.image = UIImage(named: "Boat.png")
    someImage.translatesAutoresizingMaskIntoConstraints = false
    return someImage
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(imageView)
    ImageViewSetupConstraints()
  }

  func ImageViewSetupConstraints() {
    
    NSLayoutConstraint.activate(
    [imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    imageView.widthAnchor.constraint(equalToConstant: 200),
    imageView.heightAnchor.constraint(equalToConstant: 200)]
    )
    
//    let safeAreaInsets = view.safeAreaInsets
//
//    let marginSpacing: CGFloat = 16
//    let topSpace = safeAreaInsets.top + marginSpacing
//    let leadingSpace = safeAreaInsets.left + marginSpacing
//    let trailingSpace = safeAreaInsets.right + marginSpacing
//
//    let profileImageViewVerticalConstraints =
//      NSLayoutConstraint.constraints(
//        withVisualFormat: "V:|-topSpacing-[profileImageView(profileImageViewHeight)]",
//        options: [],
//        metrics: ["topSpacing": topSpace, "profileImageViewHeight": 40],
//        views: ["ImageView": imageView]
//      )
  }

}

