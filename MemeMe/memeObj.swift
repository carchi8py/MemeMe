//
//  memeObj.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/19/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import Foundation
import UIKit

class memeObj {
    let topText, bottomText: NSString
    let plainImage, memedImage: UIImage
    init(topText: NSString, bottomText:NSString, plainImage: UIImage, memedImage: UIImage)
    {
        self.topText = topText
        self.bottomText = bottomText
        self.plainImage = plainImage
        self.memedImage = memedImage
    }
}