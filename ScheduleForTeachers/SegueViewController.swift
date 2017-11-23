//
//  SegueViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 17.11.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet var greetingsText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsText.text = "Welcome, \(nameForGreetings)!"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
