//
//  DetailPageComponent.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import Swinject
import RxSwift
import SwinjectAutoregistration

final class DetailPageComponent {
    
    static func register(_ container: Container){
        
        container.autoregister(DetailPageViewModel.self, initializer: DetailPageViewModel.init)
                
        container.storyboardInitCompleted(DetailPageViewController.self) { r, c in
            c.viewModel = r.resolve(DetailPageViewModel.self)
            c.disposeBag = r.resolve(DisposeBag.self)
        }
    }
}
