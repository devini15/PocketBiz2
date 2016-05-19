//
//  SecondViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import BDGShare
class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var customer = Accounts()
    var customers = Accounts()
    var picker = UIImagePickerController()
    var photos = [UIImage]()
    var count = 0
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.allowsEditing = true
        self.navigationItem.title = customer.name
        nameTextField.text = customer.name
        locationTextField.text = customer.location
        
        }
     func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.photos.append(info[UIImagePickerControllerEditedImage] as! UIImage)
        }
    }
    @IBAction func addImage(sender: AnyObject) {
        let actionsheet = UIAlertController(title: "title", message: nil, preferredStyle: .ActionSheet)
        actionsheet.popoverPresentationController?.sourceView = self.view
        actionsheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width , height: 100)
        let libraryButton = UIAlertAction(title: "Photo Library", style: .Default) { (action) -> Void in
        self.picker.sourceType  = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)
            
        }
        actionsheet.addAction(libraryButton)
        
        let camerabutton = UIAlertAction(title: "Camera", style: .Default) { (action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.picker, animated: true, completion: nil)
        }
        actionsheet.addAction(camerabutton)
        
        presentViewController(actionsheet, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "Matt"{
        
            let nvc = segue.destinationViewController as! MapViewController
            nvc.location = customers.name
            
            
        }
    
    }
    
}

func animateImage()
{
    if self.photos.count > 0 {
        if self.count < self.photos.count - 1 && self.photos.count != 1 {
        }else{
            self.count = 0
        }
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.imageView.alpha = 0.0
            }, completion: { (finished) -> Void in
                self.imageView.image = self.photos[self.count]
                UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                    self.imageView.alpha = 1.0
                    }, completion: { (finished) -> Void in
                        
                } ) } ) } } } }
