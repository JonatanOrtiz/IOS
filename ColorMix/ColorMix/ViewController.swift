import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var redSwitch: UISwitch!
  @IBOutlet weak var greenSwitch: UISwitch!
  @IBOutlet weak var blueSwitch: UISwitch!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var resetButton: UIButton!
  
  
  @IBAction func switchChanged(_ sender: UISwitch) {
    updateColor()
  }
  @IBAction func sliderChanged(_ sender: UISlider) {
    updateColor()
  }
  
  @IBAction func reset(_ sender: UIButton) {
    redSwitch.isOn = false
    greenSwitch.isOn = false
    blueSwitch.isOn = false
    redSlider.value = 0
    greenSlider.value = 0
    blueSlider.value = 0
    updateColor()
  }
  
  func updateControls() {
      redSlider.isEnabled = redSwitch.isOn
      greenSlider.isEnabled = greenSwitch.isOn
      blueSlider.isEnabled = blueSwitch.isOn
  }
  
  func updateColor() {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    if redSwitch.isOn {
      red = CGFloat(redSlider.value)
    }
    if greenSwitch.isOn {
      green = CGFloat(greenSlider.value)
    }
    if blueSwitch.isOn {
      blue = CGFloat(blueSlider.value)
    }
    let color = UIColor(red: red, green: green,
                        blue: blue, alpha: 1)
    colorView.backgroundColor = color
    updateControls()
    updateThumbSliderColor()
  }
  
  func updateThumbSliderColor() {
    redSlider.minimumTrackTintColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: CGFloat(redSlider.value))
    redSlider.thumbTintColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.07 + CGFloat(redSlider.value))
    greenSlider.minimumTrackTintColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: CGFloat(greenSlider.value))
    greenSlider.thumbTintColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.07 + CGFloat(greenSlider.value))
    blueSlider.minimumTrackTintColor = UIColor.init(red: 0, green: 0, blue: 1, alpha: CGFloat(blueSlider.value))
    blueSlider.thumbTintColor = UIColor.init(red: 0, green: 0, blue: 1, alpha: 0.07 + CGFloat(blueSlider.value))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resetButton.layer.borderWidth = 1
    resetButton.layer.borderColor = UIColor.blue.cgColor
    resetButton.layer.cornerRadius = 5
    
    colorView.layer.borderWidth = 5
    colorView.layer.cornerRadius = 20
    colorView.layer.borderColor =
       UIColor.black.cgColor
    
    updateColor()
    updateControls()
    updateThumbSliderColor()
  }
}

