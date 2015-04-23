//
//  ViewController.swift
//  MemeMe
//
//  Created by Chris Archibald on 4/14/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var ourToolbar: UIToolbar!
    @IBOutlet weak var ourNavBar: UINavigationItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    let topDelegate = MemeTextFieldDelegate()
    let bottomDelegate = MemeTextFieldDelegate()
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : 3.0
    ]
    
    override func viewWillAppear(animated: Bool) {
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        // Subscribe to keyboard notifications to allow the view to raise when necessary
        self.subscribeToKeyboardNotifications()
        self.subscribeToDissmissKeyboardNotifications()

    }
    
    override func viewWillDisappear(animated: Bool) {

        self.unsubscribeToKeyboardNotifications()
        self.unsubscribeToDissmissKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the text properties
        self.topText.defaultTextAttributes = memeTextAttributes
        self.bottomText.defaultTextAttributes = memeTextAttributes
        self.topText.delegate = topDelegate
        self.bottomText.delegate = bottomDelegate
        self.shareButton.enabled = false
        
    }
    @IBAction func cancle()
    {
        //TODO get Cancle to work
        self.topText.text = ""
        self.bottomText.text = ""
        self.shareButton.enabled = false
    }
    
    @IBAction func save() {
        //Create a meme
        let memedImage = generateMemedImage()
        var meme = memeObj(topText: topText.text!, bottomText: bottomText.text!, plainImage: imagePickerView.image!, memedImage: memedImage)
        let activityContoller = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        self.presentViewController(activityContoller, animated: true, completion: nil)
    }
    
    func generateMemedImage() -> UIImage {
        
        ourToolbar.hidden = true
        navigationController?.navigationBarHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        ourToolbar.hidden = false
        navigationController?.navigationBarHidden = false
        
        return memedImage
    }
    
    //Image Picking Methods

    @IBAction func pickAnImage(sender: AnyObject) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
        self.shareButton.enabled = true
    }
    
    @IBAction func pickAnImageFromCamera(sender: AnyObject) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(pickerController, animated: true, completion: nil)
        self.shareButton.enabled = true
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.shareButton.enabled = false
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imagePickerView.image = image
            self.imagePickerView.contentMode = UIViewContentMode.ScaleAspectFill

        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Notification center methods
    
    func keyboardWillShow(notification: NSNotification) {
        if bottomText.isFirstResponder() {
            self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if bottomText.isFirstResponder() {
            self.view.frame.origin.y += getKeyboardHeight(notification)
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func subscribeToDissmissKeyboardNotifications () {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func unsubscribeToDissmissKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }

}

