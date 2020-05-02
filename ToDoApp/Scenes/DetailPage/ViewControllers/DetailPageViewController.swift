//
//  DetailPageViewController.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailPageViewController: BaseViewController, DetailPageStoryboardLoadable {
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var statusImgView: UIImageView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var toggleStatusButton: UIButton!
    
    var task: TaskStateDTO!
    var viewModel: DetailPageViewModel!
    var disposeBag : DisposeBag!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        titleTextView.text = task.title
        statusImgView.image = task.completed ? UIImage(named: "checked") : UIImage(named: "unchecked")
        setupUIBindings()
    }
    
    private func setupUIBindings() {
        updateButton.rx.tap.bind {
            self.task.title = self.titleTextView.text
            self.viewModel.updateTask(self.task)
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
        deleteButton.rx.tap.bind {
            self.viewModel.removeTask(self.task)
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
        toggleStatusButton.rx.tap.bind {
            self.task.completed.toggle()
            self.statusImgView.image = self.task.completed ? UIImage(named: "checked") : UIImage(named: "unchecked")
        }.disposed(by: disposeBag)
    }
        
    
}
