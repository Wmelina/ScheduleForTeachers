//
//  ScheduleTableViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 29.10.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


    var arrayOfTeachers:Array<Any> = []
    var timeLabel = ["08:00 - 09:30", "09:40 - 11:10", "11:20 - 12:50", "13:00 - 14:30", "14:40 - 16:10", "16:20 - 17:50", "18:00 - 19:30"]
    var dayOfTheWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]
    var weekChooser = "odd"

class ScheduleTableViewController: UITableViewController {

    @IBOutlet var segmContr: UISegmentedControl!
    var inde : Int! = 0
    
    @IBAction func chooseWeek(_ sender: Any) {
        switch segmContr.selectedSegmentIndex {
        case 0:
            inde = 0
            tableView.reloadData()
        case 1:
            inde = 7
            tableView.reloadData()
        default:
            break
        }
    }

    func getLessons() {
        
        
        let urlz = "https://2c7218ff.ngrok.io/lessons/?q={\"Имя\":\"\(arrayOfTeachers[segueInt] as! String)\"}"
        print(urlz)
        let urkzStr = urlz.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString
        let jsonUrl = NSURL(string:urkzStr as String)
        let jsonData = try? NSData(contentsOf: jsonUrl! as URL, options: NSData.ReadingOptions.uncached)
        let parsedJson = JSON(data: jsonData! as Data)
        print(parsedJson)
        let lessonzz = parsedJson["Пары"].array!
        print(lessonzz)
        print(lessonzz.count)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLessons()
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dayOfTheWeek[section]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
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
