//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by Jonatan Eduardo de Araujo on 21/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  
  let disposeBag = DisposeBag()
  private var viewModel: RestaurantsListViewModel!
  
  static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    let viewController = storyboard.instantiateInitialViewController() as! ViewController
    viewController.viewModel = viewModel
    return viewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.tableFooterView = UIView()
    
    navigationItem.title = viewModel.title
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.contentInsetAdjustmentBehavior = .never
    
    viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
      cell.textLabel?.text = viewModel.displayText
    }.disposed(by: disposeBag)
    
    //    let service = RestaurantService()
    //    service.fetchRestaurants().subscribe(onNext: { restaurants in
    //      print(restaurants)
    //    }).disposed(by: disposeBag)
    
    
  }
}
