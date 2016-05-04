// Devin
//  Matt Runge
//  ViewController.swift
//  PocketBiz
//
//  Created by student3 on 5/2/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    var AccountsArray : [Accounts] = [Accounts]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customerOne = Accounts(Name: "Customer #1", Location: "707 Glendale Dr Prospect Heights")
        AccountsArray.append(customerOne)
        

        
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
        NVC.customer = AccountsArray[currentRow!]
        
        
    }


}
