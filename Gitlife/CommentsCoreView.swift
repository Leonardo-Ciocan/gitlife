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
    
    var Comments = [ ["name" : "John" , "body":"Hello"] , ["name":"Susan" , "body":"Hello from me too"]]
    
    override func viewDidLoad() {
                super.viewDidLoad()
        self.tableView.registerClass(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        self.inverted=false
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 64.0
        self.tableView.separatorStyle = .None
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell") as! CommentCell
        cell.lblName.text = Comments[indexPath.item]["name"]
        cell.lblBody.text = Comments[indexPath.item]["body"]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Comments.count
    }
    
    override func didPressRightButton(sender: AnyObject!) {
        self.textView.refreshFirstResponder()
        Comments.append( ["name": (PFUser.currentUser()?.username)! , "body" : self.textView.text])
        self.textView.text = ""
        self.tableView.reloadData()
    }
    
}