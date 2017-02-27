//
//  UITabBarAnimation.swift
//  TabDemo
//
//  Created by croyneaus4u on 07/02/17.
//  Copyright © 2017 croyneaus4u. All rights reserved.
//

import Foundation
import UIKit

public typealias BadgeAnimationCompletionBlock = ((Void) -> Void)

public protocol UITabbarItemBadgeAnimation {
    
    func tabBarBageAppearAnimationWithBadge(_ badge: UILabel, value: String, completion: BadgeAnimationCompletionBlock?)
    func tabBarBageDisappearAnimationWithBadge(_ badge: UILabel, completion: BadgeAnimationCompletionBlock?)
    
}
