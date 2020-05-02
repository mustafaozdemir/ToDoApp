//
//  DetailPageCoordinator.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Swinject
import UIKit
import RxSwift

public enum DetailScene:String, AppScene {
    
    case back = "back"
    case main = "detail"
    
    public var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "Detail"
    }
        
    public var coordinator: BaseCoordinator.Type{
        return DetailPageCoordinator.self
    }
}

final class DetailPageCoordinator:  BaseCoordinator {
    
    override func start(_ name:AppScene, data:Any) {
        viewController = container.resolveViewController(DetailPageViewController.self)
        let _data = data as! [String:Any]
        (viewController as! DetailPageViewController).task = _data["task"] as? TaskStateDTO
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func navigate(scene: AppScene, data: Any) {
        
    }
    
    override func back(_ viewController: UIViewController) {
        navigationController.popViewController(animated: true)
    }
}

