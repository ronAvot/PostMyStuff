//
//  post.swift
//  post-my-stuff
//
//  Created by ron avot on 25.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import Foundation

class post:NSObject,NSCoding {
    
    //variables
    private var _imagePath: String!
    private var _title:String!
    private var _postDesc:String!
    
    //getters
    var imagePath:String{
        return _imagePath
    }
    var title:String{
        return _title
    }
    var postDesc:String{
        return _postDesc
    }
    //initialaztion
    init(imagePath:String,title:String,description:String){
        self._imagePath = imagePath
        self._title = title
        self._postDesc = description
    }
    
    //init for coding
    override init() {
        
    }
    
    //load object to save on disck
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
    }
    
    //Functions
    
    //encodeObject mean load data from the object dic by key
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._postDesc, forKey: "description")
    }
    
    
    
    
}
