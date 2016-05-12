//
//  SecondViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var customer = Accounts()
    var customers = Accounts()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = customer.name
        nameTextField.text = customer.name
        locationTextField.text = customer.location

     
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "Matt"{
        
            let nvc = segue.destinationViewController as! MapViewController
            nvc.location = customers.name
            
            
        }}
}


