//
//  Navigation.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation

public struct Navigation<T> {
    
    public let scene: AppScene
    public let data:Any
    public let name: String?
    
    public init(_ scene:AppScene, data:Any, name: String? = nil) {
        self.scene = scene
        self.data = data
        self.name = name
    }
}
