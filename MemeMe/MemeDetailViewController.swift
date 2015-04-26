//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/26/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeImage: UIImageView!
    
    var meme : memeObj!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.memeImage.image = meme.memedImage
    }
}
