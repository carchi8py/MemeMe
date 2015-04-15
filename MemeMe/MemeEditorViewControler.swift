//
//  ViewController.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/14/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController {

    @IBOutlet weak var imagePickerView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pickAnImage(sender: AnyObject) {
        
        let pickerController = UIImagePickerController()
        self.presentViewController(pickerController, animated: true, completion: nil)
    }

}

