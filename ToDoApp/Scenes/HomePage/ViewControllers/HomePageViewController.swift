//
//  HomePageViewController.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import SwiftMessages

final class HomePageViewController: BaseViewController, HomePageStoryboardLoadable {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var viewModel: HomePageViewModel!
    var disposeBag: DisposeBag!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTaskButton()        
        bindTableViewToPage()
    }
    
    private func setupAddTaskButton() {
        
        addTaskButton.rx.tap.bind {            
            let popup = try! SwiftMessages.viewFromNib(named: "AddNewTaskView") as! AddNewTaskView
            popup.viewModel = self.viewModel            
            var config = SwiftMessages.Config()
            config.presentationStyle = .center
            config.duration = .forever
            config.keyboardTrackingView = KeyboardTrackingView()
            config.dimMode = .blur(style: .dark, alpha: 1.0, interactive: true)
            config.interactiveHide = true
            SwiftMessages.show(config: config, view: popup)
        }.disposed(by: disposeBag)
        
    }
            
}
