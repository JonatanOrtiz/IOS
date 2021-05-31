//
//  Converter.swift
//  First
//
//  Created by Jonatan Eduardo de Araujo on 13/04/21.
//

import Foundation

struct Converter {
  func convertToCelsius(fahrenheit: Double) -> Double {
    let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
    let celsius = fahrenheit.converted(to: .celsius)
    return celsius.value
  }
}
