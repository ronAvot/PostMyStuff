//
//  PostCell.swift
//  post-my-stuff
//
//  Created by ron avot on 25.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //@IBOutlets
    @IBOutlet weak var postImg:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak  var descLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
    }
    
    //functions
    func configureCell(posts:post){
        titleLbl.text = posts.title
        descLbl.text = posts.postDesc
        postImg.image = DataService.instance.imageForPath(posts.imagePath)
    }


}
