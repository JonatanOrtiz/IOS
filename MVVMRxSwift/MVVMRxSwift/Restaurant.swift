//
//  Restaurant.swift
//  MVVMRxSwift
//
//  Created by Jonatan Eduardo de Araujo on 21/03/21.
//

import Foundation

struct Restaurant: Decodable {
  let name: String
  let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
  case european
  case indian
  case mexican
  case french
  case english
}
