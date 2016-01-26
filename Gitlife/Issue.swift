//
//  Issue.swift
//  Gitlife
//
//  Created by Leonardo Ciocan on 24/01/2016.
//  Copyright © 2016 LC. All rights reserved.
//

import Foundation
import Parse

class Issue : PFObject {
    @NSManaged var title : String?
    @NSManaged var body : String?
    @NSManaged var author : PFUser?
    var closed : Bool {
        get{
            print(self["Closed"])
            return self["Closed"] as! Bool
        }
        set{ self["Closed"] = newValue }
    }
    
    override class func query() -> PFQuery? {
        let q = PFQuery(className: Issue.parseClassName())
        q.includeKey("author")
        q.orderByAscending("createdAt")
        return q
    }
    
    init(title : String , author : PFUser , body : String){
        super.init()
        self.title = title
        self.author = author
        self.body = body
        //implicit
        self.closed = false
    }
    
    override init(){
        super.init()
    }
}

extension Issue : PFSubclassing {
    class func parseClassName() -> String {
        return "Issue"
    }

    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }

}

