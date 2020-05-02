//
//  AddNewTaskView.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import Reusable
import SwiftMessages

final class AddNewTaskView: MessageView, NibLoadable {
    
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var viewModel: HomePageViewModel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        guard let text = bodyTextField.text, text.count >= 1 else {
            self.bodyTextField.placeholder = "Text can not be null."
            return
        }
        viewModel.addNewTask(text: text)
        SwiftMessages.hide()
    }
    
}
