//
//  DetailPageViewModel.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class DetailPageViewModel {
    
    private var disposeBag: DisposeBag!
    let stateManager = StateManager.getInstance()
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }
    
    func updateTask(_ task: TaskStateDTO) {
        try? self.stateManager.get(.task).update(TaskStateAction.upsert(task), success: {
            print("Task updated successfully")
        })
    }
    
    func removeTask(_ task: TaskStateDTO) {
        try? self.stateManager.get(.task).update(TaskStateAction.remove(task.id), success: {
            print("Task deleted successfully")
        })
    }
    
        
}
