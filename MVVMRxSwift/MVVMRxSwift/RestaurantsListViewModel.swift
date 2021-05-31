//
//  RestaurantsListViewModel.swift
//  MVVMRxSwift
//
//  Created by Jonatan Eduardo de Araujo on 21/03/21.
//

import Foundation
import RxSwift

class RestaurantsListViewModel {
  let title = "Restaurants"
  
  private let restaurantService: RestaurantServiceProtocol
  
  init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
    self.restaurantService = restaurantService
  }
  
  func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
    restaurantService.fetchRestaurants().map { $0.map {
      RestaurantViewModel(restaurant: $0)
    } }
  }
  
}
