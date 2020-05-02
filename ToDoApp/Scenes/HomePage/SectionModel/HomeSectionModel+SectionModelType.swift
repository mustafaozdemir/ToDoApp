//
//  HomePageSectionModel+SectionModelType.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator

extension HomeSectionModel: SectionModelType {
    
    typealias Item = HomeSectionItem
    
    var items: [HomeSectionItem] {
        switch  self {
        case .TaskSection(_, let items):
            return items.map {$0}
        }
    }
    
    init(original: HomeSectionModel, items: [Item]) {
        switch original {
        case let .TaskSection(title, items):
            self = .TaskSection(title: title, items: items)
        }
    }
}
