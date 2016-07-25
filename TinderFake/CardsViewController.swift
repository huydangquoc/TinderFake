//
//  CardsViewController.swift
//  TinderFake
//
//  Created by Dang Quoc Huy on 7/25/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }

}

 