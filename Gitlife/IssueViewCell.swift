//
//  IssueViewCell.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 24/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import Foundation
import UIKit

class IssueViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!

    @IBOutlet weak var lblBody: UILabel!
    
    func setData(issue : Issue){
        lblName.text = issue.title
        lblBody.text = issue.body
    }
}
