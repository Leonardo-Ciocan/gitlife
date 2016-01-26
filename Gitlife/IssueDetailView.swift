//
//  IssueDetailView.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 24/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailView : UIViewController{
    
    @IBOutlet weak var data: UITextView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var issueStatus : UILabel?

    var i : Issue?
    
    func putData( i : Issue){
        print(i.body)
        self.i = i
       
    }
    
    override func viewDidLoad() {
        if(self.i != nil){
            self.data.text = i!.body
            self.lblTitle.text = i!.title
            self.issueStatus?.text = i!.closed ? "Closed" : "Open"
        }
    }
    
    func refreshIssueStatus(){
        self.issueStatus?.text = i!.closed ? "Closed" : "Open"
    }
}
