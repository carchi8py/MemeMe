//
//  MemeTextFieldDelegate.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/19/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import Foundation
import UIKit

class MemeTextFieldDelegate : NSObject, UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        //TODO: Fix this later
        textField.text = " ";
        textField.textAlignment = NSTextAlignment.Center
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
