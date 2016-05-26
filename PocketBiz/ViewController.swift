// Devin
//  Matt Runge
//  ViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/2/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var AccountsArray : [Accounts] = [Accounts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let customerOne = Accounts(Name: "707 Glendale Dr Prospect Heights", Location: "707 Glendale Dr Prospect Heights")
        AccountsArray.append(customerOne)
        let customerTwo = Accounts(Name: "Devin", Location: "705 Glendale Dr Prospect Heights")
        AccountsArray.append(customerTwo)
        let customerThree = Accounts(Name: "Tom", Location: "705 Glendale Dr Prospect Heights")
        AccountsArray.append(customerThree)
        
        

        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        let currentCollege = AccountsArray[indexPath.row]
        currentCell.textLabel!.text = currentCollege.name
        return currentCell

}
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! SecondViewController
        let currentRow = myTableView.indexPathForSelectedRow?.row
        NVC.newAccounts = AccountsArray[currentRow!]
        
        
    }
    
    
    


}
