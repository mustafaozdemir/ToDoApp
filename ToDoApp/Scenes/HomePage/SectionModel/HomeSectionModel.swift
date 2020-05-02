//
//  HomePageSectionModel.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxDataSources

enum HomeSectionModel {
    case TaskSection(title: String, items: [HomeSectionItem])
    
    var estimatedHeight: CGFloat {
        switch self {
        case .TaskSection:
            return 100
        }        
    }
}

enum HomeSectionItem {
    case TaskItem(TaskStateDTO)
}
