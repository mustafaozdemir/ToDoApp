//
//  TaskStateItem.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RealmSwift

enum TaskStateAction: StateProtocol {
    case upsert(TaskStateDTO)
    case remove(String)
    case removeAll
}

class TaskStateObject: Object, StateProtocol {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var createdAt = Date()
    @objc dynamic var completed = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

public struct TaskStateListDTO: StateProtocol {
    let taskStateList: Array<TaskStateObject>
}

public struct TaskStateDTO {
    public var id: String
    public var title: String
    public var createdAt: Date
    public var completed: Bool
    
    public init(_ id: String, title: String, createdAt: Date, completed: Bool) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.completed = completed
    }
}

