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
    var i : Issue?
    
    func putData( i : Issue){
        print(i.body)
        self.i = i
       
    }
    
    override func viewDidAppear(animated: Bool) {
        if(self.i != nil){
            self.data.text = i!.body
        }
    }
}
