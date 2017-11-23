//
//  ViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 27.09.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit
//var asdasd = NSArray(
var nameForGreetings = ""
var probJson = [["Логин":"Kov","Пароль":"123456789","Уровень":1],["Логин":"Nosova","Пароль":"12345678","Уровень":0],["Логин":"Nosov","Пароль":"1234567890","Уровень":0]]
var userTrig = false
var adminTrig = false
var passtrig = false
var allutrig = false
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signIn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
 //       let jsonMaker = WorkWithJSON()
//        let usersFromJson = jsonMaker.readJson(jsonName: "/Users/admin/Desktop/вход") as? NSArray
//        asdasd = usersFromJson as? NSArray
        
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
    
    func findUser() {
        userTrig = false
        adminTrig = false
        passtrig = false
        allutrig = false
        for i in 0..<probJson.count {
                    if let dict = probJson[i] as? NSDictionary {
                    if (dict["Логин"] as? String)! == loginTextField.text {
                        allutrig = true
                    if (dict["Пароль"] as? String)! == passwordTextField.text {
                        passtrig = true
                        nameForGreetings = loginTextField.text!
                        if probJson[i]["Уровень"] as? Int == 1 {
                            userTrig = true
                            break
                        }
                        if probJson[i]["Уровень"] as? Int == 0 {
                            adminTrig = true
                            break
                        }
                    }
            }
        }
    }
        if allutrig == false {
            myAlert(titleText: "Error", messageText: "User not found")
        }
        if allutrig, passtrig == false {
            myAlert(titleText: "Error", messageText: "Error password")
        }
    }

    @IBAction func signIn(_ sender: UIButton) {
        
        NSLog((probJson[1]["Логин"] as? String)!)
        if (loginTextField.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Login must contain at least one character")
        }
        if (passwordTextField.text?.characters.count)! < 8 {
            myAlert(titleText: "Error", messageText: "Password must contain at least 8 characters")
        }
        findUser()
        if userTrig {
            performSegue(withIdentifier: "userSegue", sender: nil)
        }
        if adminTrig {
            performSegue(withIdentifier: "adminSegue", sender: nil)
        }
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

