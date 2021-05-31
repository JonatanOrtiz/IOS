import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  private var loginViewModel = LoginViewModel()
  private var disposebag = DisposeBag()
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  @IBAction func tappedLoginButton(_ sender: UIButton) {
    print("tapped login button")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    userNameTextField.becomeFirstResponder()
    
    userNameTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposebag)
    passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposebag)
    
    loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposebag)
    loginViewModel.isValid().map { $0 ? 1 : 0.1 }.bind(to: loginButton.rx.alpha).disposed(by: disposebag)
    
  }
}

class LoginViewModel {
  
  let usernameTextPublishSubject = PublishSubject<String>()
  let passwordTextPublishSubject = PublishSubject<String>()
  
  func isValid() -> Observable<Bool> {
    return Observable.combineLatest(passwordTextPublishSubject.asObservable().startWith(""), passwordTextPublishSubject.asObservable().startWith("")).map {
      userName, password in
      print("fez \(Int.random(in: 0...100))")
      return userName.count > 3 && password.count > 3
    }.startWith(false)
  }
  
}
