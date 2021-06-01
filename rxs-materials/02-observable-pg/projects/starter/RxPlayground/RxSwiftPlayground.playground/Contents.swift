import Foundation
import RxSwift

/// Represents a sequence event.
///
/// Sequence grammar:
/// **next\* (error | completed)**
public enum Event<Element> {
    /// Next element is produced.
    case next(Element)

    /// Sequence terminated with an error.
    case error(Swift.Error)

    /// Sequence completed successfully.
    case completed
}

example(of: "just, of, from") {
  // 1
  let one = 1
  let two = 2
  let three = 3
  
  // 2
  let observable = Observable<Int>.just(one)
}
