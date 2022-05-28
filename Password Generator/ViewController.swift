//
//  ViewController.swift
//  Password Generator
//
//  Created by Pravahan J. on 27/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Text Field and SLider Label
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var outputFieldView : UITextField!
    
    
    // Parameters for Password Generation
    var length: Int = 5
    var upperCase: Bool = false
    var symbol: Bool = false
    var number: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputFieldView.layer.cornerRadius = 10
        outputFieldView.defaultTextAttributes.updateValue(2.0,
             forKey: NSAttributedString.Key.kern)
        
        
    }
    
    
    // Password Generator Function
    func generator(len: Int) -> String {
        let source1: String = "abcdefghijklmnopqrstuvwxyz"
        let source2: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let source3: String = "!@#$%^&*()_><,.:;'"
        let source4: String = "0123456789"
        
       
        
        var source = source1
        
        if(upperCase) {
            source += source2
        } else {
            if(symbol) {
                if(number) {
                    source = source1 + source3 + source4
                } else {
                    source = source1 + source3
                }
            } else {
                if(number) {
                    source = source1 + source4
                } else {
                    source = source1
                }
            }
        }
        
        if(symbol) {
            source += source3
        } else {
            if(upperCase) {
                if(number) {
                    source = source1 + source2 + source4
                } else {
                    source = source1 + source2
                }
            } else {
                if(number) {
                    source = source1 + source4
                } else {
                    source = source1
                }
            }
        }
        
        if(number) {
            source += source4
        } else {
            if(upperCase) {
                if(symbol) {
                    source = source1 + source2 + source3
                } else {
                    source = source1 + source2
                }
            } else {
                if(symbol) {
                    source = source1 + source3
                } else {
                    source = source1
                }
            }
        }
        
        
        
        var password = ""

        for _ in 0 ..< len {
            password.append(source.randomElement()!)
        }
        return password
    }

    
    
    
    @IBAction func upperCaseSwitch(_ sender: UISwitch) {
        if(sender.isOn == true) {
            upperCase = true
        } else {
            upperCase = false
        }
    }

    @IBAction func symbolSwitch(_ sender: UISwitch) {
        if(sender.isOn == true) {
            symbol = true
        } else {
            symbol = false
        }
    }

    @IBAction func numberSwitch(_ sender: UISwitch) {
        if(sender.isOn == true) {
            number = true
        } else {
            number = false
        }
    }
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = Int(sender.value)
        label.text = "\(value)"
        length = value
    }
    
    @IBAction func generateDidTrigger(_ sender: UIButton) {
        outputFieldView.text = "\(generator(len : length))"
    }
    
    @IBAction func copyDidTrigger() {
        UIPasteboard.general.string = outputFieldView.text
    }
       
}
