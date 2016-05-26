//
//  SecondViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var customer = Accounts()
    var customers = Accounts()
    var picker = UIImagePickerController()
    var photos = [UIImage]()
    var newAccounts = Accounts()
    
    
    
    
    
    
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
            self.imageView.image = (info[UIImagePickerControllerEditedImage] as! UIImage)
            
            
            
        }
    }
    @IBAction func addImage(sender: UIButton) {
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
    
    
    @IBAction func shareButtonPlease(sender: UIBarButtonItem) {
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "matt"{
            
            let nvc = segue.destinationViewController as! MapViewController
            nvc.location = customer.name
            
    }
    
    
    
}


}
