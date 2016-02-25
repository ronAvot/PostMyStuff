//
//  addPostVC.swift
//  post-my-stuff
//
//  Created by ron avot on 25.2.2016.
//  Copyright © 2016 ron avot. All rights reserved.
//

import UIKit

class addPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //@IBOutlets
    @IBOutlet weak var postImg: UIImageView!

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    
    //Variables
    var imagePicker:UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    //@IBActions
    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descField.text, let img = postImg.image
        {
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            let Post = post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(Post)
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton) {
    sender.setTitle("", forState: .Normal)
    presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func cancelBtnPressed(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    //functions
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    

}
