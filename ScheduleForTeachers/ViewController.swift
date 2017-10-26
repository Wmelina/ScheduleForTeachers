//
//  ViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 27.09.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore. 
    {
        textField.resignFirstResponder()
        
        return true
    }
    

    @IBAction func signIn(_ sender: UIButton) {
        if (loginTextField.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Login must contain at least one character")
        }
        if (passwordTextField.text?.characters.count)! < 8 {
            myAlert(titleText: "Error", messageText: "Password must contain at least 8 characters")
        }
        //here will be profile check
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        let newLength = text.utf16.count + string.utf16.count - range.length
        return newLength <= 30
    }
    
    func myAlert(titleText : String, messageText : String) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }

}

