//
//  TeacherTableViewCell.swift
//  ScheduleForTeachers
//
//  Created by Admin on 24.10.17.
//  Copyright © 2017 NewbieBand. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    @IBOutlet weak var teacherName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
