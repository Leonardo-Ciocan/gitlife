//
//  CreateIssueViewController.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 24/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import UIKit
import Parse

class CreateIssueViewController: UIViewController {

    @IBOutlet var txtName : UITextField?
    @IBOutlet var txtBody : UITextView?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createIssue(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        let newIssue = Issue(title: (txtName?.text)!, author: PFUser.currentUser()! , body: (txtBody?.text)!)
        newIssue.saveInBackground()
    }

   

}
