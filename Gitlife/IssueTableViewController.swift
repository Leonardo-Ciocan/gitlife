//
//  IssueTableViewController.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 24/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import Foundation
import UIKit
import Parse

class IssueTableViewController : UITableViewController , UISearchResultsUpdating , UISearchBarDelegate {
    
    
    var data : [Issue] = []
    var searchController : UISearchController?
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.tableView.registerNib(UINib(nibName: "IssueViewCell", bundle: nil), forCellReuseIdentifier: "IssueViewCell")
        
        //self.tableView.allowsSelection = false
        self.tableView.separatorStyle = .SingleLine
        self.tableView.separatorColor = UIColor.grayColor()
        
        
        
        Parse.setApplicationId("3jmXTtK4n6dDtcv4h4FERiED9wLluOCLiraOWIey",
            clientKey: "5W4Q6PscUTp6vGiREKd6QbBetOWVdOFTCI6Fp1Q6")
        
        do{
            try PFUser.logInWithUsername("leonardo", password: "cake")
        }
        catch {
            
        }
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController?.searchResultsUpdater = self
        self.searchController?.dimsBackgroundDuringPresentation = false
        self.searchController?.searchBar.scopeButtonTitles = ["Open" , "Closed"]
        self.searchController?.searchBar.delegate = self
        self.searchController?.searchBar.sizeToFit()
        self.searchController?.hidesNavigationBarDuringPresentation = false
        self.searchController?.searchBar.tintColor = AppDelegate.color
        self.searchController?.searchBar.barTintColor = UIColor.whiteColor()
        self.searchController?.searchBar.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).CGColor
        
        self.tableView.tableHeaderView = self.searchController?.searchBar
        self.definesPresentationContext = true
        
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        let query = Issue.query()!
        query.findObjectsInBackgroundWithBlock({objects , err in
            
            if err == nil {
                if let objects = objects as? [Issue] {
                    self.data = objects
                    self.tableView.reloadData()
                }
                else{
                    print(objects)
                }
            }
            else{
                print("some issue")
            }
        })
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IssueViewCell", forIndexPath: indexPath) as! IssueViewCell
        cell.setData(data[indexPath.item])
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        AppDelegate.currentIssue = data[(self.tableView.indexPathForSelectedRow?.item)!]
        self.performSegueWithIdentifier("toDetail", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetail" {
        segue.destinationViewController.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        segue.destinationViewController.navigationItem.title = "" //data[(self.tableView.indexPathForSelectedRow?.item)!].title
        segue.destinationViewController.navigationItem.backBarButtonItem?.title = "Issues"
        segue.destinationViewController.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        //print("segue")
        ((segue.destinationViewController as! UITabBarController).viewControllers![0] as? IssueDetailView)!.putData( data[(self.tableView.indexPathForSelectedRow?.item)!])
        }
    }
}