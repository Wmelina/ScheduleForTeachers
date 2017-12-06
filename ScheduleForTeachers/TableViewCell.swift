//
//  TableViewCell.swift
//  ScheduleForTeachers
//
//  Created by Admin on 06.12.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameInRequest: UILabel!
    
    @IBOutlet var loginInRequest: UILabel!
    
    @IBOutlet var indetifierInRequest: UILabel!
    
    
    @IBOutlet var statusInRequest: UILabel!
    
    
    @IBOutlet var commentInRequest: UITextView!
    
    @IBAction func decline(_ sender: Any) {
        let parameters = ["Токен": token, "Вердикт": ["\(identifiersIn[didSelectedRowForChoose])" : "Отклонить"]] as [String : Any]
        
        guard let url = URL(string: "https://65621f20.ngrok.io/accounts/uniconfirmed/confirm/") else { return }
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    print(json)
                    let when = DispatchTime.now() + 5
                    DispatchQueue.main.asyncAfter(deadline: when) {
                        
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        
    }
    
    
    @IBAction func accept(_ sender: Any) {
        let parameters = ["Токен": token, "Вердикт": ["\(identifiersIn[didSelectedRowForChoose])" : "Принять"]] as [String : Any]
        
        guard let url = URL(string: "https://65621f20.ngrok.io/accounts/uniconfirmed/confirm/") else { return }
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    print(json)
                    let when = DispatchTime.now() + 5
                    DispatchQueue.main.asyncAfter(deadline: when) {
                        
                    }
                    
                } catch {
                    print(error)
                }
            }
            
            }.resume()
        
    }
    

    
}
