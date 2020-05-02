//
//  Date+Extensions.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 2.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation

extension Date {
    
    func monthAndDayString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: self)
    }
    
    func hourAndMinuteString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
}
