//
//  Order.swift
//  OrderApp
//
//  Created by Jonatan Eduardo de Araujo on 22/03/21.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]

    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
