//
//  CoordinatorProtocol.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Swinject
import UIKit

public protocol AppScene{
    var identifier: String { get }
    var name: String { get }
    var coordinator: BaseCoordinator.Type{get}
}

 public protocol CoordinatorProtocol: AnyObject {
    func navigate(scene:AppScene, data: Any)
    func back(_ viewController: UIViewController)
    var container: Container { get }
    func start(_ scene: AppScene, data:Any)
}
