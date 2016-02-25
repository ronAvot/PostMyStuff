//
//  DataService.swift
//  post-my-stuff
//
//  Created by ron avot on 25.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import Foundation
import UIKit

class DataService {

    //variables
    static let instance = DataService()
    private var _loadedPosts = [post]()

    //getter
    var loadedPosts:[post]{
        return _loadedPosts
    }
    //Functions
    func savePosts(){
        let postDate = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postDate, forKey: "Posts")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts(){
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey("Posts") as? NSData{
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [post]{
                _loadedPosts = postsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
        
    }
    
    func saveImageAndCreatePath(image:UIImage) ->String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path:String)->UIImage?{
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(posts:post){
        _loadedPosts.append(posts)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name:String)->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }

}
