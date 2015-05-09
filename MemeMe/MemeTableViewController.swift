//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/22/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource {
    var memes : [memeObj]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
    }
    

    @IBAction func newMeme(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as! UITableViewCell
        let meme = self.memes[indexPath.row]
        
        cell.textLabel?.text = meme.topText as String
        cell.imageView?.image = meme.memedImage
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        tableView.rowHeight = 150
        return tableView.rowHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard?.instantiateViewControllerWithIdentifier("detailController") as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}