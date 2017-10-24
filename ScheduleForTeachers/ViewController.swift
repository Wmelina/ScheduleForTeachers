//
//  ViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 27.09.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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


}

