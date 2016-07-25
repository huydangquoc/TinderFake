//
//  ProfileViewController.swift
//  TinderFake
//
//  Created by Dang Quoc Huy on 7/25/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        dismissViewControllerAnimated(false, completion: nil)
    }
}
