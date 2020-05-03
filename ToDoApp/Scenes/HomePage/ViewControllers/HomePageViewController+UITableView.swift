//
//  HomePageViewController+UITableView.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift

extension HomePageViewController {
    
    internal func bindTableViewToPage() {
        registerTableViewCells()
        setupTableViewDataBinding()
        viewModel.getSavedTasks()
    }
    
    private func registerTableViewCells() {
        tableView.register(cellType: TaskItemCell.self)
    }
    
    private func setupTableViewDataBinding() {
        
        let dataSource = viewModel.dataSource()
        
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath  in
          return true
        }
            
        Observable
            .combineLatest(viewModel.sections, segmentedControl.rx.selectedSegmentIndex)
            .map{self.viewModel.filteredSectionModels(sectionModels: $0.0, index: $0.1)}
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        
        tableView.rx
            .itemDeleted
            .subscribe(onNext: { [weak self] indexPath in
                guard let cell = self?.tableView.cellForRow(at: indexPath) as? TaskItemCell else {return}
                guard let id = cell.cellData?.id else {return}
                self?.viewModel.removeTask(id: id)
            }).disposed(by: disposeBag)
        
        
        tableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let cell = self?.tableView.cellForRow(at: indexPath) as? TaskItemCell else {return}
                guard let item = cell.cellData else {return}
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.main, data:["task":item]))
            }).disposed(by: disposeBag)
    }

}
