//
//  DetailPageStoryboardLoadable.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import Foundation

public protocol DetailPageStoryboardLoadable: StoryboardLodable {}

extension DetailPageStoryboardLoadable where Self: UIViewController {
  @nonobjc static var storyboardName: String {
        return "DetailPage"
    }
}
