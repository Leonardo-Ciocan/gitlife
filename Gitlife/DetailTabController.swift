//
//  DetailTabController.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 26/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import UIKit

class DetailTabController: UITabBarController {
    
    @IBAction func actionClicked(sender:AnyObject){
        let title = AppDelegate.currentIssue!.closed ? "Reopen this issue" : "Close this issue"
        let options = UIAlertController(title: "Edit issue", message: nil, preferredStyle: .ActionSheet)
        let closeOrOpen = UIAlertAction(title: title, style: .Default, handler:
            {(alert:UIAlertAction!) -> Void in
                AppDelegate.currentIssue!.closed = !(AppDelegate.currentIssue?.closed)!
                AppDelegate.currentIssue?.saveInBackground()
                (self.viewControllers![0] as! IssueDetailView).refreshIssueStatus()
            }
        )
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        options.addAction(closeOrOpen)
        options.addAction(cancel)
        self.presentViewController(options, animated: true, completion: nil)
    }
    
}
