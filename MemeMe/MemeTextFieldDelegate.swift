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
        textField.autocapitalizationType =
        UITextAutocapitalizationType.AllCharacters
        textField.textAlignment = NSTextAlignment.Center
        textField.backgroundColor = UIColor.clearColor()
        textField.borderStyle = UITextBorderStyle.None

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}