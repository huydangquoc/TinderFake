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
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "ryan")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        // Register Nib
        let profileView = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileView.image = imageView.image!
        
        profileView.modalPresentationStyle = UIModalPresentationStyle.Custom
        profileView.transitioningDelegate = self
        
        // Present View "Modally"
        presentViewController(profileView, animated: true, completion: nil)
    }
}

extension CardsViewController: UIViewControllerTransitioningDelegate {

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}

extension CardsViewController: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if (isPresenting) {
            animatePresentationWithTransitionContext(transitionContext)
        } else {
            animateDismissalWithTransitionContext(transitionContext)
        }
    }
    
    private func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let containerView = transitionContext.containerView(),
            let toViewControllerView = transitionContext.viewForKey(UITransitionContextToViewKey),
            let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        // Position the presented view off the top of the container view
        toViewControllerView.frame = transitionContext.finalFrameForViewController(toViewController)
        
        containerView.addSubview(toViewControllerView)
        toViewController.view.alpha = 0
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            transitionContext.completeTransition(true)
        }
    }
    
    private func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else {
                return
        }
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            transitionContext.completeTransition(true)
            fromViewController.view.removeFromSuperview()
        }
    }
}
