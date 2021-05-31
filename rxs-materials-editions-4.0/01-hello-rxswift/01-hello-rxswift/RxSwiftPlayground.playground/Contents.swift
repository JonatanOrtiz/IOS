import UIKit
import RxSwift
import RxRelay

//example(of: "create") {
//  let disposeBag = DisposeBag()
//
//  Observable<String>.create { observer in
//    // 1
//    observer.onNext("1")
//
//    // 2
//    observer.onCompleted()
//
//    // 3
//    observer.onNext("?")
//
//    // 4
//    return Disposables.create()
//  }
//
//  .subscribe(
//    onNext: { print($0) },
//    onError: { print($0) },
//    onCompleted: { print("Completed") },
//    onDisposed: { print("Disposed") }
//  )
//  .disposed(by: disposeBag)
//}

//example(of: "Single") {
//  // 1
//  let disposeBag = DisposeBag()
//
//  // 2
//  enum FileReadError: Error {
//    case fileNotFound, unreadable, encodingFailed
//  }
//
//  // 3
//  func loadText(from name: String) -> Single<String> {
//    // 4
//    return Single.create { single in
//      // 1
//      let disposable = Disposables.create()
//
//      // 2
//      guard let path = Bundle.main.path(forResource: name, ofType: "txt") else {
//        single(.error(FileReadError.fileNotFound))
//        return disposable
//      }
//
//      // 3
//      guard let data = FileManager.default.contents(atPath: path) else {
//        single(.error(FileReadError.unreadable))
//        return disposable
//      }
//
//      // 4
//      guard let contents = String(data: data, encoding: .utf8) else {
//        single(.error(FileReadError.encodingFailed))
//        return disposable
//      }
//
//      // 5
//      single(.success(contents))
//      return disposable
//
//    }
//  }
//  // 1
//  loadText(from: "Copyright")
//    // 2
//    .subscribe {
//      // 3
//      switch $0 {
//      case .success(let string):
//        print(string)
//      case .error(let error):
//        print(error)
//      }
//    }
//    .disposed(by: disposeBag)
//
//}

//// MARK: -
//
//example(of: "PublishRelay") {
//  let relay = PublishRelay<String>()
//
//  let disposeBag = DisposeBag()
//
//  relay.accept("Knock knock, anyone home?")
//
//  relay
//    .subscribe(onNext: {
//      print($0)
//    })
//    .disposed(by: disposeBag)
//
//  relay.accept("1")
//
//
//}

//example(of: "distinctUntilChanged(_:)") {
//  let disposeBag = DisposeBag()
//
//  // 1
//  let formatter = NumberFormatter()
//  formatter.numberStyle = .spellOut
//  // 2
//  Observable<NSNumber>.of(10, 110, 20, 200, 210, 310)
//    // 3
//    .distinctUntilChanged { a, b in
//      // 4
//      guard
//        let aWords = formatter
//          .string(from: a)?
//          .components(separatedBy: " "),
//        let bWords = formatter
//          .string(from: b)?
//          .components(separatedBy: " ")
//      else {
//        return false
//      }
//      var containsMatch = false
//      // 5
//      for aWord in aWords where bWords.contains(aWord) {
//        containsMatch = true
//        break
//      }
//      return containsMatch
//    }
//    // 4
//    .subscribe(onNext: {
//      print($0)
//    })
//    .disposed(by: disposeBag)
//}

//struct Student {
// let score: BehaviorSubject<Int>
//}
//
//example(of: "flatMapLatest") {
//  let disposeBag = DisposeBag()
//  let laura = Student(score: BehaviorSubject(value: 80))
//  let charlotte = Student(score: BehaviorSubject(value: 90))
//  let student = PublishSubject<Student>()
//  student.flatMapLatest {
//    $0.score
//  }
//  .subscribe(onNext: {
//    print($0)
//  })
//  .disposed(by: disposeBag)
//  student.onNext(laura)
//  laura.score.onNext(85)
//  student.onNext(charlotte)
//
//  laura.score.onNext(95)
//  laura.score.onNext(75)
//   charlotte.score.onNext(100)
//  charlotte.score.onNext(65)
//}

example(of: "combineLatest") {
  let left = PublishSubject<String>()
  let right = PublishSubject<String>()
  // 1
  let observable = Observable.combineLatest(left, right) {
    lastLeft, lastRight in
    "\(lastLeft) \(lastRight)"
  }
  _ = observable.subscribe(onNext: { value in
    print(value)
  })
  // 2
  print("> Sending a value to Left")
  left.onNext("Hello1,")
  left.onNext("Hello2,")
  left.onNext("Hello3,")
  print("> Sending a value to Right")
  right.onNext("world")
  right.onNext("world2")
  print("> Sending another value to Right")
  right.onNext("RxSwift")
  print("> Sending another value to Left")
  left.onNext("Have a good day,")
  left.onCompleted()
  right.onCompleted()
}
