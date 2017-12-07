//
//  TeacherTableViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 24.10.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


var segueInt:Int = 0


class TeacherTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getTeachers()

    }
    
    func getTeachers() {
        let url = "https://2c7218ff.ngrok.io/accounts/teachers/"
        let jsonUrl = NSURL(string:url)
        let jsonData = try? NSData(contentsOf: jsonUrl! as URL, options: NSData.ReadingOptions.uncached)
        let sdfsdf = JSON(data: jsonData! as Data)
        for i in 0..<sdfsdf["Преподаватели"].count {
            arrayOfTeachers.append((sdfsdf["Преподаватели"][i].string)!)
        }
        print(arrayOfTeachers)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTeachers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let rowNumber : Int = indexPath.row
        cell.textLabel?.text = arrayOfTeachers[rowNumber] as? String
        
        return cell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segueInt = indexPath.row
        performSegue(withIdentifier: "TeacherSegue", sender: self)
    }
 

    }



