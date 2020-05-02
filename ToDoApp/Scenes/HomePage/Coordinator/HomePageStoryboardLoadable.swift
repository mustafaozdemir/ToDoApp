//
//  HomePageStoryboardLoadable.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import Foundation

public protocol HomePageStoryboardLoadable: StoryboardLodable {}

extension HomePageStoryboardLoadable where Self: UIViewController {
  @nonobjc static var storyboardName: String {
        return "HomePage"
    }
}
