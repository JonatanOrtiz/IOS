//
//  ViewController.swift
//  01-hello-rxswift
//
//  Created by Jonatan Eduardo de Araujo on 01/04/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  func example() {
    let disposeBag = DisposeBag()
    
    Observable<String>.create { observer in
      // 1
      observer.onNext("1")
      
      // 2
      observer.onCompleted()
      
      // 3
      observer.onNext("?")
      
      // 4
      return Disposables.create()
    }
    
    .subscribe(
      onNext: { print($0) },
      onError: { print($0) },
      onCompleted: { print("Completed") },
      onDisposed: { print("Disposed") }
    )
    .disposed(by: disposeBag)


  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    for _ in 0...100000 {
      example()
    }
    view.backgroundColor = .red
  }


}

