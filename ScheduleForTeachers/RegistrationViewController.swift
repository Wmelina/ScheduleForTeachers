//
//  RegistrationViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 24.10.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var emailAdr: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confPassword: UITextField!
    
    @IBOutlet weak var sendRequest: UIButton!
    
    var msg = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func sendRequest(_ sender: Any) {
        if (fullName.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Login must contain at least one character")
        }
        if (emailAdr.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Email must contain at least one character")
        }
        if (password.text?.characters.count)! < 8 {
            myAlert(titleText: "Error", messageText: "Password must contain at least 8 characters")
        }
        if confPassword.text != password.text {
            myAlert(titleText: "Error", messageText: "Passwords must be the same")
        }
        //also here
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
