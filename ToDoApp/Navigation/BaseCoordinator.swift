//
//  BaseCoordinator.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import Swinject

public class BaseCoordinator: CoordinatorProtocol {
    
    public var navigationController: BaseNavigationController
    public let container: Container
    public let disposeBag: DisposeBag
    public let fromViewController: BaseViewController?
    var viewController : BaseViewController!
    var currentScene: AppScene!
    
    required init(container: Container, navigationController: BaseNavigationController,
         disposeBag: DisposeBag, fromViewController: BaseViewController?) {
        self.container = container
        self.navigationController = navigationController
        self.disposeBag = disposeBag
        self.fromViewController = fromViewController
    }
    
    public func navigate(scene: AppScene, data: Any) {
        //not implemented
    }
    
    public func back(_ viewController: UIViewController) {
        //not implemented
    }
    
    public func start(_ scene: AppScene, data: Any) {
        //not implemented
    }
    
}
