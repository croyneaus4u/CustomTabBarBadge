//
//  DefaultBadgeAnimation.swift
//  TabDemo
//
//  Created by croyneaus4u on 08/02/17.
//  Copyright © 2017 croyneaus4u. All rights reserved.
//

import Foundation
import UIKit
import CustomTabBarBadge

let ANIMATION_TIME = 0.2
let ANIMATION_SCALE = 1.0

class DefaultBadgeAnimation: UITabbarItemBadgeAnimation {
    
    func tabBarBageAppearAnimationWithBadge(_ badge: UILabel, value: String, completion: BadgeAnimationCompletionBlock?) {
        // appearance animation
        badge.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: ANIMATION_TIME, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            badge.transform = CGAffineTransform.identity
        }) { (finished) in
            completion?()
        }
    }
    
    func tabBarBageDisappearAnimationWithBadge(_ badge: UILabel, completion: BadgeAnimationCompletionBlock?) {
        // disappear animation
        UIView.animate(withDuration: ANIMATION_TIME, animations: { 
            badge.transform = CGAffineTransform.init(scaleX: 0.0, y: 0.0)
        }) { (finished) in
            completion?()
            badge.transform = CGAffineTransform.identity
        }
    }
    
}
