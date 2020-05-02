//
//  StoryboardLoadable.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit

public protocol StoryboardLodable: AnyObject {
    @nonobjc static var storyboardName: String { get }
}

