//
//  CommentsCoreView.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 26/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import UIKit
import SlackTextViewController
import Parse

class CommentsCoreView : SLKTextViewController {
    override class func tableViewStyleForCoder(decoder: NSCoder) -> UITableViewStyle {
        return UITableViewStyle.Plain;
    }
    
    var Comments : [Comment] = []
    
    override func viewDidLoad() {
                super.viewDidLoad()
        self.tableView.registerClass(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        self.inverted=false
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 64.0
        self.tableView.separatorStyle = .None
        
        let query = Comment.query()
        query?.whereKey("issue", equalTo: AppDelegate.currentIssue!)
        query?.findObjectsInBackgroundWithBlock({ objects , err in
            if err == nil {
                if let objects = objects as? [Comment] {
                    self.Comments = objects
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell") as! CommentCell
        cell.lblName.text = Comments[indexPath.item].author?.username
        cell.lblBody.text = Comments[indexPath.item].body
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Comments.count
    }
    
    override func didPressRightButton(sender: AnyObject!) {
        self.textView.refreshFirstResponder()
        
        let newComment = Comment(author: PFUser.currentUser()!, body: self.textView.text , issue: AppDelegate.currentIssue!)
        
        self.Comments.append(newComment)
        
        
        self.textView.text = ""
        self.tableView.reloadData()
        
        newComment.saveInBackground()
    }
    
}