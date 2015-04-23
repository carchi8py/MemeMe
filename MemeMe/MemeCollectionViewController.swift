//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/22/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController : UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes : [memeObj]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
    }
}
