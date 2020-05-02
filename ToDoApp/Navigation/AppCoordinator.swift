//
//  AppCoordinator.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import os.log
import UIKit
import RxSwift
import Swinject

enum AppMainScene: String, AppScene {
    
    case app = "app"
    case homePage = "homepage"
    case detailPage = "detailPage"
    
    var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "AppMain"
    }
    
    var coordinator: BaseCoordinator.Type{
        return BaseCoordinator.self
    }

}

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    private let window: UIWindow
    private let disposeBag: DisposeBag = DisposeBag()

    let container: Container

    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        
        NavigationService.initializeNavigationService(container,
                                                      disposeBag: disposeBag,
                                                      fromViewController: nil)
    }

    func start(_ name: AppScene, data:Any) {
                                
        let homeViewController = container.resolveViewController(HomePageViewController.self)
        let navigationController = BaseNavigationController(rootViewController: homeViewController)
        navigationController.navigationBar.tintColor = .black
        self.window.rootViewController = navigationController
        
        homeViewController.navigationSubject.subscribe(onNext: { navigation in
            
            let homepageCoordinator = HomepageCoordinator(container: self.container,
                                                          navigationController: navigationController,
                                                          disposeBag: self.disposeBag,
                                                          fromViewController: nil)
            
            try! NavigationService
                .requestNavigationObject()
                .start(fromViewController: homeViewController,
                       navigationController: navigationController,
                       prevCoordinator: homepageCoordinator,
                       nextScene: navigation.scene,
                       data: navigation.data)
            
            
        }).disposed(by: disposeBag)
    }
    
    func navigate(scene: AppScene, data: Any) {
    }
    
    func back(_ viewController: UIViewController) {
    }

}

