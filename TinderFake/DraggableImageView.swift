//
//  DraggableImageView.swift
//  TinderFake
//
//  Created by Dang Quoc Huy on 7/25/16.
//  Copyright © 2016 Dang Quoc Huy. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        // custom initialization logic
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .Changed:
            let reverseRotation = recognizer.locationInView(self).y > frame.height / 2
            let translation = recognizer.translationInView(self)
            var offset = translation.x
            if translation.x > 150 {
                offset = 360
            } else if translation.x < -150 {
                offset = -360
            }
            imageView.transform = CGAffineTransformMakeTranslation(offset, 0)
            let angle = (translation.x / imageView.frame.width)
            imageView.transform =
                CGAffineTransformRotate(imageView.transform, reverseRotation ? -angle : angle)
        case .Ended:
            imageView.transform = CGAffineTransformIdentity
        default:
            break
        }
    }
}
