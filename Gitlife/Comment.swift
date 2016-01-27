//  Issue.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 24/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import Foundation
import Parse

class Comment : PFObject {
    @NSManaged var body : String?
    @NSManaged var author : PFUser?
    @NSManaged var issue : Issue?
    
    override class func query() -> PFQuery? {
        let q = PFQuery(className: Comment.parseClassName())
        q.includeKey("author")
        q.orderByAscending("createdAt")
        return q
    }
    
    init(author : PFUser , body : String , issue : Issue){
        super.init()
        self.author = author
        self.body = body
        self.issue = issue
    }
    
    override init(){
        super.init()
    }
}

extension Comment : PFSubclassing {
    class func parseClassName() -> String {
        return "Comment"
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
}

