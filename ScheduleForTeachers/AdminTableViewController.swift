//
//  AdminTableViewController.swift
//  ScheduleForTeachers
//
//  Created by Admin on 06.12.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit
import SwiftyJSON

var namesIn:Array<String> = []
var loginsIn:Array<String> = []
var identifiersIn:Array<Int> = []
var statusesIn:Array<String> = []
var commentsIn:Array<String> = []
var didSelectedRowForChoose = 0

class AdminTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequests()
        
    }
    
    func getRequests() {
        let url = "https://2c7218ff.ngrok.io/accounts/unconfirmed/?q={\"Токен\":\"\(token)\"}"
        let urlStr = url.addingPercentEscapes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))! as NSString
        let jsonUrl = NSURL(string:urlStr as String)
        let jsonData = try? NSData(contentsOf: jsonUrl! as URL, options: NSData.ReadingOptions.uncached)
        let parsedJson = JSON(data: jsonData! as Data)
        
        print(parsedJson)
        
        let requests = parsedJson["Заявки"].array!
        for i in 0..<requests.count {
            namesIn.append(parsedJson["Заявки"][i]["Имя"].string!)
            loginsIn.append(parsedJson["Заявки"][i]["Логин"].string!)
            identifiersIn.append(parsedJson["Заявки"][i]["Идентификатор"].int!)
            statusesIn.append(parsedJson["Заявки"][i]["Статус"].string!)
            commentsIn.append(parsedJson["Заявки"][i]["Заявка"].string!)
            
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 218
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return namesIn.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
            let rowNumber : Int = indexPath.row

            cell.nameInRequest.text = namesIn[rowNumber]
            cell.loginInRequest.text = loginsIn[rowNumber]
            let idntInt : Int  = identifiersIn[rowNumber]
            let idntStr = String(idntInt)
            cell.indetifierInRequest.text = idntStr
            cell.statusInRequest.text = statusesIn[rowNumber]
            cell.commentInRequest.text = commentsIn[rowNumber]
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectedRowForChoose = indexPath.row
    }
}




