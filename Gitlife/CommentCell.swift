//
//  CommentCell.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 26/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import UIKit
import SnapKit

class CommentCell: UITableViewCell {
    lazy var lblName : UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    lazy var lblBody : UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        label.textColor = UIColor(red: 0/255.0, green: 128/255.0, blue: 64/255.0, alpha: 1.0)
        return label
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
    }
    
    // We won’t use this but it’s required for the class to compile
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureSubviews() {
            self.addSubview(self.lblName)
            self.addSubview(self.lblBody)

            lblName.snp_makeConstraints { (make) -> Void in
                    make.top.equalTo(self).offset(10)
                    make.left.equalTo(self).offset(20)
                    make.right.equalTo(self).offset(-20)
        }

            lblBody.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(lblName.snp_bottom).offset(1)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.bottom.equalTo(self).offset(-10)
        }
    }
}