//
//  PhotoBrowserDismissAnimator.swift
//  GHPhotoBrowser
//
//  Created by Mac on 2019/1/22.
//  Copyright © 2019 gh. All rights reserved.
//

import UIKit

class GHPhotoBrowserDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //        let tabbarC = transitionContext.viewController(forKey: .to) as! UITabBarController
        //        let navC = tabbarC.selectedViewController as! UINavigationController
        //        let toVC = navC.viewControllers.first as! FirstViewController
        
        let fromVC = transitionContext.viewController(forKey: .from) as! GHPhotoBroserViewController
        let moveView = fromVC.moveView//browserView.imgView
        moveView.image = fromVC.imgAry[fromVC.currentPage]
        moveView.isHidden = false
        fromVC.browserCollectionView.isHidden = true
        fromVC.pageControl.isHidden = true
        let theFrame = fromVC.imgViewFrameAry[fromVC.currentPage]
        //注意：dismiss时，toView在 custom 情况下 不能添加到containerView上，否则会出现dismiss后此toView消失不见，其他情况的模态转场可以 不受影响
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            moveView.frame = theFrame
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
}
