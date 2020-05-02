//
//  HomePageCoordinator.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Swinject
import UIKit
import RxSwift

public enum HomepageScene:String, AppScene{
    
    case back = "back"
    case homepage = "homepage"
    
    public var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "Homepage"
    }
        
    public var coordinator: BaseCoordinator.Type{
        return HomepageCoordinator.self
    }
}

final class HomepageCoordinator:  BaseCoordinator {
    
    override func start(_ name:AppScene, data:Any) {
        viewController = container.resolveViewController(HomePageViewController.self)
        navigationController.pushViewController(viewController, animated: true)                        
    }
    
    override func navigate(scene: AppScene, data: Any) {
    }
    
    override func back(_ viewController: UIViewController) {
        
    }
}

