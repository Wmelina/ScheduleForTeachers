//
//  WorkWithJSON.swift
//  ScheduleForTeachers
//
//  Created by Admin on 17.11.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class WorkWithJSON: NSObject  {
     func readJson(jsonName:String) -> Any {
        do {
            if let file = Bundle.main.url(forResource: jsonName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                return json
                
            }
        } catch {
            print(error.localizedDescription)
            //return error.localizedDescription
        }
        return NSLog("complete")
    }

}
