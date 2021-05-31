//
//  FirstTests.swift
//  FirstTests
//
//  Created by Jonatan Eduardo de Araujo on 13/04/21.
//

import XCTest
@testable import First

class ConvertTests: XCTestCase {
  
  var sut: Converter!
  
  override func setUpWithError() throws {
    sut = Converter()
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func test32FahrenheitIsZeroCelsius() {
    // given
    let input = 32.0
    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)
    // then
    XCTAssertEqual(celsius, 0, accuracy: 0.000001)
  }
  
  func test212FahrenheitIs100Celsius() {
    // given
    let input = 212.0
    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)
    // then
    XCTAssertEqual(celsius, 100, accuracy: 0.000001)
  }
  
  func test100FahrenheitIs37Celsius() {
    // given
    let input = 100.0
    // when
    let celsius = sut.convertToCelsius(fahrenheit: input)
    // then
    XCTAssertEqual(celsius, 37.777777, accuracy: 0.000001)
  }
  
}
