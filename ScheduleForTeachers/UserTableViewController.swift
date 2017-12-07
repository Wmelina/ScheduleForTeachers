//
//  UserTableViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 05.12.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var arrayOfGroups:Array<String> = []
var numberOfLesson : Array<Int> = []
var auditory : Array<String> = []
var typeOfPairz : Array<String> = []
var dayOfTheWeekz : Array<Int> = []
var nameOfPairz : Array<String> = []
class UserTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLessons()
        

    }
    var inde : Int! = 0
    @IBOutlet var segmContr: UISegmentedControl!
    @IBAction func segChanged(_ sender: Any) {
        switch segmContr.selectedSegmentIndex {
        case 0:
            inde = 0
            tableView.reloadData()
        case 1:
            inde = 7
            tableView.reloadData()
        default:
            break
        }    }
    func getLessons() {

        
        let urlz = "https://2c7218ff.ngrok.io/lessons/?q={\"Имя\":\"\(nameOf)\"}"
        print(urlz)
        let urkzStr = urlz.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString
        let jsonUrl = NSURL(string:urkzStr as String)
        let jsonData = try? NSData(contentsOf: jsonUrl! as URL, options: NSData.ReadingOptions.uncached)
        let parsedJson = JSON(data: jsonData! as Data)
        print(parsedJson)
        print(parsedJson.count)
        let lessonzz = parsedJson["Пары"].array!
        for i in 0..<lessonzz.count {
            arrayOfGroups.append(parsedJson["Пары"][i]["Группы"][0].string!)
            numberOfLesson.append(parsedJson["Пары"][i]["Номер"].int!)
            auditory.append(parsedJson["Пары"][i]["Аудитория"].string!)
            typeOfPairz.append(parsedJson["Пары"][i]["Тип"].string!)
            dayOfTheWeekz.append(parsedJson["Пары"][i]["День"].int!)
            nameOfPairz.append(parsedJson["Пары"][i]["Название"].string!)
        }
        print(arrayOfGroups)
        print(nameOfPairz)
        print(numberOfLesson)
        print(typeOfPairz)
        print(dayOfTheWeekz)
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dayOfTheWeek[section]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowNumber : Int = indexPath.row
        let sectionNumber : Int = indexPath.section
        let cell = Bundle.main.loadNibNamed("LessonTableViewCell", owner: self, options: nil)?.first as! LessonTableViewCell
        for i in 0..<arrayOfGroups.count {
            if sectionNumber + inde == dayOfTheWeekz[i] {
                    if rowNumber == numberOfLesson[i] {

                        cell.groupsNameLabel.text = arrayOfGroups[i]
                        cell.nameLabel.text = nameOfPairz[i]
                        cell.roomLabel.text = auditory[i]
                        cell.typeOfLesson.text = typeOfPairz[i]
                    }
                }
        }

        cell.timeLabel.text = timeLabel[indexPath.row]
        return cell
    }


}
