//
//  ViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 27.09.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

var token = ""
var nameOf = ""
var jsonFromServer : [String:String] = [:]
var triggerForAdminSegue = false
var triggerForUserSegue = false
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signIn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        removeAllElementsOfArrays()
        
        
    }

    func removeAllElementsOfArrays() {
        arrayOfGroups.removeAll()
        numberOfLesson.removeAll()
        auditory.removeAll()
        typeOfPairz.removeAll()
        dayOfTheWeekz.removeAll()
        nameOfPairz.removeAll()
        arrayOfTeachers.removeAll()
        namesIn.removeAll()
        loginsIn.removeAll()
        identifiersIn.removeAll()
        statusesIn.removeAll()
        commentsIn.removeAll()
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

    func findUser() {

        let a = self.loginTextField.text
        let b = self.passwordTextField.text
        let parameters = ["Логин": a, "Пароль": b]
        
        guard let url = URL(string: "https://2c7218ff.ngrok.io/login/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
                    print(json)
                    let when = DispatchTime.now() + 5
                    DispatchQueue.main.asyncAfter(deadline: when) {
                    nameOf = json["Имя"]!
                    token = json["Токен"]!
                    if json["Статус"]! == "Преподаватель" {
                        self.performSegue(withIdentifier: "userSegue", sender: nil)
                    }
                    if json["Статус"]! == "Админ" {
                        self.performSegue(withIdentifier: "adminSegue", sender: nil)
                    }
                        
                    }

                } catch {
                    print(error)
                }
            }
            
            }.resume()

        
        
    }

    @IBAction func signIn(_ sender: UIButton) {
        removeAllElementsOfArrays()
        triggerForUserSegue = false
        triggerForAdminSegue = false

        if (loginTextField.text?.characters.count)! < 1 {
            myAlert(titleText: "Error", messageText: "Login must contain at least one character")
        }
        if (passwordTextField.text?.characters.count)! < 2 {
            myAlert(titleText: "Error", messageText: "Password must contain at least 8 characters")
        }
        findUser()

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
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }

    

    @IBAction func removeAll(_ sender: Any) {
        removeAllElementsOfArrays()
        performSegue(withIdentifier: "guestSegue", sender: nil)
    }
}

