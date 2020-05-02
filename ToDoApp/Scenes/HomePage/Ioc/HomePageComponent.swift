//
//  HomePageComponent.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import Swinject
import RxSwift
import SwinjectAutoregistration

final class HomepageComponent {
    
    static func register(_ container: Container){
        
        container.autoregister(HomePageViewModel.self, initializer: HomePageViewModel.init)
                
        container.storyboardInitCompleted(HomePageViewController.self) { r, c in
            c.viewModel = r.resolve(HomePageViewModel.self)
            c.disposeBag = r.resolve(DisposeBag.self)            
        }
    }
}

