//
//  CardsViewController.swift
//  TinderFake
//
//  Created by Dang Quoc Huy on 7/25/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var imageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "ryan")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
