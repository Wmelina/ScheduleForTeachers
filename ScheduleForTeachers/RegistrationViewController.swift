//
//  RegistrationViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 24.10.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstName: UITextField!
    
    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var status: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confPassword: UITextField!
    
    @IBOutlet weak var sendRequest: UIButton!
    
    @IBOutlet var comment: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
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
        var errorTrig = true
        if (fullName.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Login must contain at least one character")
            errorTrig = false
        }
        if (status.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Status must contain at least one character")
            errorTrig = false
        }
        if (password.text?.characters.count)! < 8 {
            myAlert(titleText: "Error", messageText: "Password must contain at least 8 characters")
            errorTrig = false
        }
        if confPassword.text != password.text {
            myAlert(titleText: "Error", messageText: "Passwords must be the same")
            errorTrig = false
        }
        if (fullName.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Name must contain at least one character")
            errorTrig = false
        }
        if (comment.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Comment must contain at least one character")
            errorTrig = false
        }

        if errorTrig {

        let parameters = ["Логин":fullName.text!, "Пароль":password.text!, "Заявка":comment.text!,"Имя":fullName.text!, "Статус":status.text!]
        
        guard let url = URL(string: "https://65621f20.ngrok.io/accounts/unconfirmed/new/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        print(httpBody)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:String]
                    print(json!)
                } catch {
                    print(error)
                }
            }
            
            }.resume()
            myAlert(titleText: "Success", messageText: "Request successfully sended")
            
            self.fullName.text = ""
            self.status.text = ""
            self.comment.text = ""
            self.confPassword.text = ""
            self.password.text = ""
            self.firstName.text = ""
            

        }
    }

}
