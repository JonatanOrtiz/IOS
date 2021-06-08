//import UIKit
//import Foundation
//import PlaygroundSupport


//
//let x = 2
//
//func guardTest() -> Bool {
//  guard x == 1 else { return false }
//  return true
//}
//print(String(guardTest()))
//
//let imagePaths = ["star": "/glyphs/star.png",
//                  "portrait": "/images/content/portrait.jpg",
//                  "spacer": "/images/shared/spacer.gif"]
//func unwrapped() {
//  guard let starPath = imagePaths["star"] else {
//    print("Couldn't find the star image")
//    return
//  }
//  print("The star image is at '\(starPath)'")
//  print("The star image is at '\(imagePaths["star"])'")
//}
//unwrapped()

//var z: String?
//z = "hey"
//
//func unwrapped2() {
//  guard let z = z else {
//    print("Couldn't find the star image")
//    return
//  }
//  print("The star image is at '\(z)'")
//}
//unwrapped2()


//if let starPath = imagePaths["star"] {
//    print("The star image is at '\(starPath)'")
//  print("The star image is at '\(imagePaths["star"])'")
//} else {
//    print("Couldn't find the star image")
//}
//print(type(of: imagePaths["star"]))

//
//func guardURLTest() {
//  let Url = String(format: "http://10.10.10.53:8080/sahambl/rest/sahamblsrv/userlogin")
//      guard let serviceUrl = URL(string: Url) else { return }
//  print(serviceUrl)
//}
//guardURLTest()
//
//var optionalName: String? = "John Appleseed"
//var greeting = "Hello!"
//if let name = optionalName {
//    greeting = "Hello, \(name)"
//}
//print(greeting)
//
//@propertyWrapper struct Capitalized {
//    var wrappedValue: String {
//        didSet { wrappedValue = wrappedValue.capitalized }
//    }
//
//    init(wrappedValue: String) {
//        self.wrappedValue = wrappedValue.capitalized
//    }
//}
//
//struct User {
//    @Capitalized var firstName: String
//    @Capitalized var lastName: String
//}
//
//var user1 = User(firstName: "jonatan", lastName: "ortiz")
//print(user1.firstName)
//user1.firstName = "dionatan"
//print(user1.firstName)
//
//struct Document {
//    @Capitalized var name = "Untitled document"
//}
//
//var document = Document()
//print(document.name)
//
//
//@propertyWrapper struct UserDefaultsBacked<Value> {
//    let key: String
//    var storage: UserDefaults = .standard
//
//    var wrappedValue: Value? {
//        get { storage.value(forKey: key) as? Value }
//        set { storage.setValue(newValue, forKey: key) }
//    }
//}
//

//let arr = [1,2,3]
//arr.append(5)
//print(arr)

//let dic = ["teste": [1,4,8], "teste2": 6 ] as [String : Any]
//let dic2 = ["teste3": dic, "teste4": "3", "teste5": ["a": 2, "b": ["c": 2, "d": 3]] ] as [String : Any]
//print(dic)
//print(dic2)
//print(dic2["teste5"]!["a"]!)

//if let x = dic["teste2"] {
//  print(x)
//}

//var linha1 = ["0","1","2"]
//var linha2 = ["a","b","c"]
//var linha3 = ["#","$","%"]
//
//var tabela = [linha1, linha2, linha3]
//
//print(tabela/*linha*/[1]/*coluna*/[2])

//let arr = ["a","b","c"]
//
//let indexOfA = arr.firstIndex(of: "a") 
//let indexOfB = arr.firstIndex(of: "b") 
//let indexOfD = arr.firstIndex(of: "d") 

//var array3D = [[[String]]]()
//
//let array3D = [[[String]]](repeating: [[String]], count: 5, repeatedValue:
//    [[String]](count: 5, repeatedValue: []))

//
//let tabela = [[[1,2,3],[4,5,6]],[[7,8,9],[10,11,12]]]
//
//for x in 0..<tabela.count {
//  for y in 0..<tabela[0].count {
//    for z in 0..<tabela[0][0].count {
//      print(tabela[x][y][z])
//    }
//  }
//}

//let x = (1, 2, "a", 4)
//
//x.0
//x.1
//x.2
//x.3

//func testOrGuard() {
//  let testString1: String? = nil
//  let testString2 = ""
//
//  guard testString1 is String || testString2 is String else {
//    print("else")
//    return
//  }
//  print("testString1: \(testString1)")
//  print("testString1: \(testString2)")
//}
//testOrGuard()

//let stringArray = ["a","b","c","d","e","f","g"]
//let intArray = [2,4,6,78,4,23,65,89]
//
//func findeAnyIndex<T: Comparable>(_ array:[T],_ key: T) -> Int? {
//  for (index, element) in array.enumerated() {
//    if element == key {
//      return index
//    }
//  }
//  return nil
//}
//
//findeAnyIndex(stringArray, "f")
//findeAnyIndex(intArray, 65)

//let oper = 16.0
//print("\(oper) squared is \(oper * oper) xx \(sqrt(oper))")

//let x = 1_000_000
//let y = x/0_1_0_0_0

//let x = ["a", "b"]
//let y = ["c", "d"]
//let z = x + y

//func sayHello(to name: String) -> String {
//  return "Howdy, \(name)"
//}
//print("\(sayHello(to: "Jayne"))")

//func fizzbuzz(number: Int) -> String {
//  switch (number % 3 == 0, number % 5 == 0) {
//  case (true, false):
//    return "Fizz"
//  case (false, true):
//    return "Buzz"
//  case (true, true):
//    return "FizzBuzz"
//  default:
//    return String(number)
//  }
//}
//print(fizzbuzz(number: 15))


//let animals = ["a","b","c"]
//for index in 0...animals.count {
//  print("\(index): \(animals[index])")
//}

//let ships = ["Ser", "Sula", "Entr", "Galac"]
//for ship in ships where ship.hasPrefix("S") {
//  print(ship  )
//}
//
//let students = [String]()
//
//students.append("Amy")
//students.append("Clara")
//students.append("Rory")

//var steps = 0
//var wall = 2
//
//repeat {
//  print("Step")
//  steps += 1
//  if steps == wall {
//    print("You have hit a wall")
//    break
//  }
//} while (steps < 10)

//let index = 4
//
//switch index {
//case 1:
//  print("Fizz")
//case 2:
//  print("Buzz")
//case 3:
//  print("FizzBuzz")
//case 3:
//  print("FizzBuzz")
//}

//enum Weather {
//  case sunny
//  case cloudy
//  case windy
//  case rainy
//}
//let today: Weather = .rainy
//switch today {
//case .windy, .rainy:
//  print("It`s not that sunny")
//case .sunny:
//  print("It`s very shiny")
//case .cloudy:
//  print("It`s a bit misty")
//}

//struct Starship {
//  var name: String {
//    didSet {
//      print("I was \(oldValue)")
//    }
//    willSet {
//      print("Now I \(newValue)")
//    }
//  }
//}
//var serenity = Starship(name: "Serenity")
//
//serenity.name = "TARDIS"

//class Workout {
//  let time: Double
//  let distance: Double
//  init(time: Double, distance: Double) {
//    self.time = time
//    self.distance = distance
//  }
//}
//
//class Run: Workout {
//  let cadence: Double
//  init(cadence: Double, time: Double, distance: Double) {
//    self.cadence = cadence
//    super.init(time: time, distance: distance)
//  }
//}
//
//class Swin: Workout {
//  let stroke: Double
//  init(stroke: Double, time: Double, distance: Double) {
//    self.stroke = stroke
//    super.init(time: time, distance: distance)
//  }
//}

//struct Employee: Equatable, Comparable {
//  var firstName: String
//  var lastName: String
//  var jobTitle: String
//  var phoneNumber: String
//
//  static func < (lhs: Employee, rhs: Employee) -> Bool {
//      return lhs.lastName < rhs.lastName
//  }
//}
//for i in 1...10 {
//      // 2
//      let n = Double(i)
//      
//      let fibonacci = Int(
//        ((pow(1.61803, n) - pow(0.61803, n)) /
//          2.23606).rounded()
//      )
//      
//      print(fibonacci)
//  }

//let numbers = [8, 6, 7, 5, 3, 1, 9]
//
//let total = numbers.reduce(1, *)

//PlaygroundPage.current.needsIndefiniteExecution = true
//
//struct PhotoInfo: Codable {
//  var title: String
//  var description: String
//  var url: URL
//  var copyright: String?
//
//  enum CodingKeys: String, CodingKey {
//    case title
//    case description = "explanation"
//    case url
//    case copyright
//  }
//}

//func fetchPhotoInfo(completion: @escaping (PhotoInfo) -> Void) {
//    var urlComponents = URLComponents(string:
//      "https://api.nasa.gov/planetary/apod")!
//    urlComponents.queryItems = [
//        "api_key": "DEMO_KEY",
//    ].map { URLQueryItem(name: $0.key, value: $0.value) }
//
//    let task = URLSession.shared.dataTask(with:
//       urlComponents.url!) { (data, response, error) in
//        let jsonDecoder = JSONDecoder()
//        if let data = data,
//            let photoInfo = try?
//               jsonDecoder.decode(PhotoInfo.self, from: data) {
//            completion(photoInfo)
//          print(response)
//        }
//        PlaygroundPage.current.finishExecution()
//    }
//
//    task.resume()
//}
//
//fetchPhotoInfo { (photoInfo) in
//    print(photoInfo)
//}

//var urlComponents = URLComponents(string:
//   "https://pokeapi.co/api/v2/pokemon/ditto")!
//urlComponents.queryItems = [
//    "api_key": "DEMO_KEY",
//    "date": "2013-07-16"
//].map { URLQueryItem(name: $0.key, value: $0.value) }
//
//let task = URLSession.shared.dataTask(with: urlComponents.url!)
//   { (data, response, error) in
//
//  if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers),
//
//       let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
//
//        print(String(decoding: jsonData, as: UTF8.self))
//
//    } else {
//
//        print("json data malformed")
//
//    }
//    PlaygroundPage.current.finishExecution()
//}
//task.resume()

//var x: UITextField?
//
//print(x?.text.map { $0 ?? "A" })

//class X {
//  var a = 0
//}
//
//var b: X? {
//  didSet {
//    print("didSet")
//  }
//}
//
//b?.a = 3
//
//
//var x = 0
//
//func loop() {
//  x += 1
//  loop()
//  return
//}
//loop()

//let alfabet = "abcdefghijklmnopqrstuvwxyz"
//var x = "The Quick brown fox jumps over the lazy dog"
//var total = 0
//
//for letter in alfabet {
//  if x.lowercased().contains(letter) {
//    total += 1
//  }
//}
//total >= 26 ? print("Is Pangrams") : print("Is not Pangrams")


//let listCharacter = "abcdefghijklmnopqrstuvwxyz"

//func pangrams(string: String) -> Bool {
//
//  let string = string.lowercased()
//
//  guard string.count >= 26 else { return false }
//
//  let verify = listCharacter.filter { string.contains($0) }
//
////  for character in listCharacter {
////
////    guard string.contains(character) else {
////      print("Is not Params")
////      print(character)
////      return false
////    }
////  }
//  print(verify)
//  return true
//}
//
//var teste = pangrams(string: "The Quick brown fox jumps over the lazy dog")

//func pangrams(_ string: String) -> Bool {
//  return "abcdefghijklmnopqrstuvwxyz".allSatisfy { string.lowercased().contains($0) }
//}
//pangrams("The Quick brown fox jumps over the lazy dog")

//let sentence = "The Quick brown fox jump over the lazy dog"
// (try NSRegularExpression(pattern: "[A-Za-z]")).matches(in: sentence, options: [], range: NSMakeRange(0, (sentence as NSString).length)) != nil
//let output = matches.map {(sentence as NSString).substring(with: $0.range)}
//print(output)

//if let s = Optional(String.init("some string")) {
//  print(s)
//}

//
//var vals: Set<String> = ["4", "5", "6"]
//vals.insert("5")
//print(vals)

//let names = ["Bear", "Joe", "Clark"]
//names.map { (s) -> String in
//  return s.uppercased()
//
//}

//
//class Square {
//  var h: Int = 0
//  var w: Int {
//    return h
//  }
//}

//var vals = [1,2,3]
//
//vals.sort{ (s1,s2) in s1<s2 }
//AnyObject

//class Test {
//  var score: Int
//  var date: Date
//}

//let n = [1,2,3,4,5,6].filter { $0 % 2 == 0 }
//print(n)

//let loopx = 5
//repeat {
//  print(loopx)
//} while loopx < 6`</p>


//for (key, value) in [1: "one", 2: "two"] {
//  print(key,value)
//}

//let x = ["Larry", "Sven", "Bear"]
//let t = x.enumerated().first().offset
//print(type(of: x))

//let t: [Any] = [1, "2", "trhee"]
//let o = t.reduce("") {  }


//protocol TUI {
//  func add(x1: Int, x2: Int) -> Int {
////  return x1 + x2
//  }
//}

//typealias Thing = [String: Any]
//var stiff: Thing
//print(type(of: stiff))

//var test = 1 == 1

//var x = 0
//
//while x < 10 {
//  x += 1
//  if x == 5 {
//    continue
//  }
//  print(x)
//}
//var x = 2.0
//var perc: Double {
//    return x == 0 ? 0 : 1 / x
//}
//print(perc)

//import Foundation

//var x = ["1", "2", "3"]
//
//var archiveURL: URL {
//  let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//  let archiveURL = documentsDirectory.appendingPathComponent("news").appendingPathExtension("plist")
//  return archiveURL
//}
//
//func saveToFile() {
//  let encoder = PropertyListEncoder()
//  do {
//    let encodedNews = try? encoder.encode(x)
//    try encodedNews?.write(to: archiveURL)
//    print(archiveURL)
//  } catch {
//    print("Error encoding news: \(error)")
//  }
//}
//
//
//saveToFile()

//import Foundation
//
//func saveImage(fileName: String) {
//
//    guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//
//    let archiveURL = documentsDirectory.appendingPathComponent(fileName)
//
//    if let url = URL(string: "https://compressjpeg.com/images/compressjpeg/logo2.png") {
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let imageData = data, error == nil else { return }
//
//            DispatchQueue.main.async {
//                if FileManager.default.fileExists(atPath: archiveURL.path) {
//                    do {
//                        try FileManager.default.removeItem(atPath: archiveURL.path)
//                        print("Removed old image")
//                    } catch let removeError {
//                        print("couldn't remove file at path", removeError)
//                    }
//                }
//
//                do {
//                    try imageData.write(to: archiveURL)
//                } catch let error {
//                    print("error saving file with error", error)
//                }
//            }
//        }
//        task.resume()
//    }
//}
//
//saveImage(fileName: "testeImagem")

//protocol Named {
//    var name: String { get }
//}
//protocol Aged {
//    var age: Int { get }
//}
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//func wishHappyBirthday(to celebrator: Named & Aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
//}
//let birthdayPerson = Person(name: "Malcolm", age: 21)
//wishHappyBirthday(to: birthdayPerson)
//
//protocol Test {
//    func funcTest(name: String)
//}
//var a: Test!
//
//
//var x = [1,2,3,4,5,6]
//
//var homeItemViews: [Int] {
//    x.map { return $0 }
//}
//
//print(homeItemViews)
//
//class Car {
//    var name: String = "Unknown"
//    init(name: String) {
//        self.name = name
//    }
//}
//class RacingCar: Car {
//    var speed = 0.0
//    init(name: String, speed: Double) {
//        self.speed = speed
//        super.init(name: name)
//    }
//}
//
//var racingCar = RacingCar(name: "Test", speed: 0.2)
//
//print(racingCar.name)
//print(racingCar.speed)

//var x: Int {
//    get {
//        return 2
//    }
//}
//print(x)

//protocol A {
//    var x: Int { get }
//}
//
//class B: A {
//    var x: Int {
//        get {
//            return 4
//        }
//        set {
//            print(newValue)
//        }
//    }
//}
//var z = B()
//z.x = 2
//print(z.x)
//z.x = 2
//print(z.x)

//protocol X {
//    var a: Int { get set }
//}
//
//protocol Y {
//    var b: Int { get set }
//}
//
//class Z: X & Y {
//    var a = 0
//    var b = 2
//}
//
//class W {
//    var s = 0
//}
//
//func printType<T>(of type: T.Type) {
//    // or you could do "\(T.self)" directly and
//    // replace `type` parameter with an underscore
//    print("\(type)")
//}
//
//printType(of: Z.self) // this should print Swift.Int
//
//
//func printInstanceDescription<T>(of instance: T) {
//    print("\(instance)")
//}
//
//printInstanceDescription(of: 42) // this should print 42
//
//struct S {}
//protocol P {}
//
//print("\(type(of: S.self))")      // S.Type
//print("\(type(of: S.Type.self))") // S.Type.Type
//print("\(type(of: P.self))")      // P.Protocol
//print("\(type(of: P.Type.self))") // P.Type.Protocol
//print("\(type(of: (X & Z).Type.self))")
//print("\(type(of: (X & Z).self))")
//
//func test(_ w: (X & Y).Type) {
//    print(w)
//}
//
//test(Z.self)
////test(W.self)
//
//var w: (X & Y).Type
//w = Z.self
////w = W.self


// MARK: - Metatypes
//
//class X {
//    required public init(){}
//    var a = 1
//}
//
//protocol Y {
//    var b: Int { get set }
//}
//
//class ReceiveType {
//    func test(twoTypes: (X & Y)) {
//        print(twoTypes)
//        print(twoTypes.a)
//        print(twoTypes.b)
//    }
//}
//
//class ReceiveMetatype: ReceiveType {
//    func receiveMetatype(twoTypesMetatype: (X & Y).Type) {
//        self.test(twoTypes: twoTypesMetatype.init())
//    }
//}
//
//class ConformXandY: X, Y {
//    var b = 2
//}
//
//ReceiveMetatype().receiveMetatype(twoTypesMetatype: ConformXandY.self)

// MARK: - isKindOf
//import UIKit
//
//var x = UIViewController()
//
//func isKindOfTest() {
//    if x.isKind(of: UIViewController.self) {
//        print(true)
//    } else {
//        print(false)
//    }
//}
//
//isKindOfTest()

//import Foundation
//
//let filteredRecipe = ["category", ""]
//
//if (filteredRecipe.filter { $0 == "A" }).isEmpty {
//    print("empty")
//}
// MARK: - extension protocol class don't need to implement what is in the extension
//protocol Test {
//    func testFunc()
//}
//
//extension Test {
//    func testFunc() {
//        print("FOI")
//    }
//}
//
//class testClass: Test {
//
//}

// MARK: - get set on property test
//class Test {
//    var z = 2
//
//    var x: Int {
//        get {
//            return z
//        }
//        set {
//            z = 4
//        }
//    }
//
//
//}
//
//var test = Test()
//test.x = 5
//test.z
//test.z = 3
//test.z

// MARK: - optional inside if condition
//class Test {
//    func funcTest() -> Bool {
//        return true
//    }
//}
//var test: Test?
//// if the class is not instantiate the if condition will be nil, so falls to the false condition, so by instantiating the class the if condition will be true because of the returning true of the function declaration
//test = Test()
//test?.funcTest()
//
//var x = 2
//var z = 4
//if test?.funcTest() ?? false {
//   z = 5
//}

// MARK: - variable conform to class protocol
//protocol X: class {
//    func test()
//}
//
//class Z {
//    var Y: X?
//}

// MARK: - dictionary on initialization of a Struct
//struct Person {
//
//    let first: String
//    let last: String
//
//}
//
//extension Person {
//
//    init(dictionary: [String: String]) {
//        self.first = dictionary["first"] ?? "John"
//        self.last = dictionary["last"] ?? "Doe"
//    }
//
//}
//var person = Person(dictionary: ["first" : "HEY", "last" : "HOY"])
//
//person.first
//person.last
