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
import RxDataSources

final class HomePageViewModel {
    
    private var disposeBag: DisposeBag!
    let stateManager = StateManager.getInstance()
    var sections = BehaviorRelay<Array<HomeSectionModel>>(value: [])
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag        
    }
    
    internal func dataSource() -> RxTableViewSectionedReloadDataSource<HomeSectionModel> {
        return  RxTableViewSectionedReloadDataSource<HomeSectionModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                switch dataSource[indexPath] {
                case .TaskItem(let dto):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TaskItemCell.self)
                    cell.cellData = dto
                    return cell
            }}
        )
    }
    
    private func defineSections(_ data: TaskStateListDTO) -> [HomeSectionModel] {
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
    
    internal func filteredSectionModels(sectionModels: [HomeSectionModel], index: Int) -> [HomeSectionModel] {
        return sectionModels.map {
            .TaskSection(title: "TaskSection", items: $0.items.filter({ item -> Bool in
                switch item {
                case .TaskItem(let dto):
                    if index == 1 {
                        return dto.completed == false
                    } else if index == 2 {
                        return dto.completed == true
                    } else {
                        return true
                    }
                }
            }))
        }
    }
    
    // MARK: - State Manager
    
    func addNewTask(text: String) {
        let item = TaskStateDTO(UUID().uuidString, title: text, createdAt: Date(), completed: false)
        try? self.stateManager.get(.task).update(TaskStateAction.upsert(item), success: {
            print("A new task saved successfully")
        })
    }
    
    internal func getSavedTasks() {
        self.stateManager.get(.task).behaviorRelay.subscribe(onNext: { [weak self] data in
            guard let _data = data as? TaskStateListDTO else {return}
            guard let _sections = self?.defineSections(_data) else {return}
            self?.sections.accept(_sections)
        }).disposed(by: disposeBag)
    }
    
    func removeTask(id: String) {
        try? self.stateManager.get(.task).update(TaskStateAction.remove(id), success: {
            print("Task deleted successfully")
        })
    }
    
}
