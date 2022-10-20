//
//  ViewController.swift
//  ReverseWords
//
//  Created by Екатерина Токарева on 20/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textFieldLine: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
        reverseButton.alpha = 0.6
        textField.delegate = self
        textField.borderStyle = .none
        textFieldLine.backgroundColor = UIColor.placeholderText
    }

    @IBAction func reverseButtonAction(_ sender: Any) {
        if resultLabel.isHidden == false {
            reverseButton.setTitle("Reverse", for: .normal)
            resultLabel.isHidden = true
            textField.text = ""
            reverseButton.alpha = 0.6
        } else {
            resultLabel.isHidden = false
            reverseButton.setTitle("Clear", for: .normal)
            resultLabel.text = reverseWords(textField.text!)
        }
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
   func textFieldDidBeginEditing(_ textField: UITextField) {
       textFieldLine.backgroundColor = reverseButton.tintColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldLine.backgroundColor = UIColor.placeholderText
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
    if text.isEmpty {
        reverseButton.alpha = 0.6
    } else {
        reverseButton.alpha = 1.0
    }
     return true
    }
    
}


