//
//  StateFactory.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift

public enum StateItem {
    case task
}

public protocol StateFactoryProtocol{
    static func getManager(_ stateItem: StateItem) -> StateManagerProtocol
}

class StateFactory : StateFactoryProtocol{
    public static func getManager(_ stateItem: StateItem) -> StateManagerProtocol {
        switch stateItem {
        case .task:
            return TaskStateManager.getInstance()
        }
    }
}
