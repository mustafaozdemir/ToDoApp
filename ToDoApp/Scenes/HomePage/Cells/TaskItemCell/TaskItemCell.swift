//
//  TaskItemCell.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import Reusable

class TaskItemCell: UITableViewCell, NibReusable {
        
    @IBOutlet weak var statusImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    let stateManager = StateManager.getInstance()

    var cellData: TaskStateDTO? {
        didSet {
            guard let dto = self.cellData else {return}
            titleLabel.text = dto.title
            statusImgView.image = dto.completed ? UIImage(named: "checked") : UIImage(named: "unchecked")                        
            dayLabel.text = dto.createdAt.monthAndDayString()
            hourLabel.text = dto.createdAt.hourAndMinuteString()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func checkedButtonClicked(_ sender: Any) {                 
        if let item = self.cellData {
            var temp = item
            temp.completed.toggle()
            try? self.stateManager.get(.task).update(TaskStateAction.upsert(temp), success: {
                print("Checkmark State Saved")
            })
        }
    }
}
