//
//  RegistrationViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 24.10.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var emailAdr: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confPassword: UITextField!
    
    @IBOutlet weak var sendRequest: UIButton!
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
