//
//  AppDelegate+Ioc.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import os.log
import Swinject
import RxSwift
import SwinjectAutoregistration

extension AppDelegate {
    
    internal func initDependencyGraph() {
        self.registerGlobalDependencies(container)
        
        //Register Components
        HomepageComponent.register(container)
        DetailPageComponent.register(container)
    }
    
    private func registerGlobalDependencies(_ container: Container){
        
        //DisposeBag
        //Singleton
        container.autoregister(DisposeBag.self, initializer: DisposeBag.init)
            .inObjectScope(.container)
        
    }
}
