//
//  TaskStateManager.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

public class TaskStateManager: StateManagerProtocol {
         
    var taskStateObject = TaskStateObject()
    let database = RealmProducer.getRealm()
    
    public var behaviorRelay: BehaviorRelay<StateProtocol>
    static let taskStateManager = TaskStateManager()
    
    init() {
        behaviorRelay = BehaviorRelay<StateProtocol>(value: TaskStateListDTO(taskStateList: []))
        behaviorRelay.accept(getItemsFromDb())
    }
    
    public static func getInstance() -> StateManagerProtocol {
        return taskStateManager
    }

    public  func update<T>(_ action: T, success: (() -> Void)?) where T : StateProtocol {
        let _action = action as! TaskStateAction
        switch _action {
        case .upsert(let dto):
            self.upsert(dto, success: success)
        case .remove(let id):
            self.remove(id, success: success)
        case .removeAll:
            self.removeAll(success)
        }
    }
    
    func getItemsFromDb() -> TaskStateListDTO {
        return TaskStateListDTO(taskStateList: Array(database.objects(TaskStateObject.self)))
    }
    
    private func upsert(_ taskStateDTO: TaskStateDTO, success: (() -> Void)?) {
        let taskStateObject = TaskStateObject()
        taskStateObject.id = taskStateDTO.id
        taskStateObject.title = taskStateDTO.title
        taskStateObject.createdAt = taskStateDTO.createdAt
        taskStateObject.completed = taskStateDTO.completed
        try? database.write {
            database.add(taskStateObject, update: .all)
        }
        let dbItems = self.getItemsFromDb()
        self.behaviorRelay.accept(dbItems)
        success?()
    }
    
    private func remove(_ id : String, success: (() -> Void)?){
        let object = database.objects(TaskStateObject.self).filter("id = %@", id).first
        try? database.write {
            if let obj = object {
                database.delete(obj)
                self.behaviorRelay.accept(getItemsFromDb())
                success?()
            }
        }
    }
    
    private func removeAll(_ success: (() -> Void)?){
        let objects = database.objects(TaskStateObject.self)
        try? database.write {
            database.delete(objects)
            self.behaviorRelay.accept(getItemsFromDb())
            success?()
        }
    }
}
