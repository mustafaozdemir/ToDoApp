//
//  HomePageViewModel.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class HomePageViewModel {
    
    private var disposeBag: DisposeBag!
    let stateManager = StateManager.getInstance()
    var sections = BehaviorRelay<Array<HomeSectionModel>>(value: [])
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag        
    }
    
    func addNewTask(text: String) {
        let item = TaskStateDTO(UUID().uuidString, title: text, createdAt: Date(), completed: false)
        try? self.stateManager.get(.task).update(TaskStateAction.upsert(item), success: {
            print("A new task saved successfully")
        })
    }
    
    func getSavedTasks() {
        self.stateManager.get(.task).behaviorRelay.subscribe(onNext: { [weak self] data in
            if let _data = data as? TaskStateListDTO {
                guard let _sections = self?.defineSections(_data) else {return}
                self?.sections.accept(_sections)
            }
        }).disposed(by: disposeBag)
    }
    
    func removeTask(id: String) {
        try? self.stateManager.get(.task).update(TaskStateAction.remove(id), success: {
            print("Task deleted successfully")
        })
    }
    
    func defineSections(_ data: TaskStateListDTO) -> [HomeSectionModel] {
        return data.taskStateList.sorted {
            return $0.createdAt.compare($1.createdAt) == .orderedDescending
        }.flatMap { item -> [HomeSectionModel] in
            let dto = TaskStateDTO(item.id,
                                   title: item.title,
                                   createdAt: item.createdAt,
                                   completed: item.completed)
            
            return [.TaskSection(title: "TaskSection", items: [.TaskItem(dto)])]
        }
    }
    
}
