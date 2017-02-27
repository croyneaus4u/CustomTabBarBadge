//
//  DefaultBadgeConfiguration.swift
//  TabDemo
//
//  Created by croyneaus4u on 07/02/17.
//  Copyright © 2017 croyneaus4u. All rights reserved.
//

import Foundation
import UIKit
import CustomTabBarBadge

class DefaultBadgeConfiguration: UITabbarItemBadgeConfiguration {
    
    var badgeBackgroundColor: UIColor
    var badgeTextColor: UIColor
    var badgeBorderColor: UIColor
    
    var badgeBorderWidth: CGFloat
    
    var badgeFont: UIFont
    
    var badgeTextTopBottomSpacing: CGFloat
    var badgeTextLeftRightSpacing: CGFloat
    var badgeMinHeight: CGFloat
    
    var badgeLabelTopSpacing: CGFloat
    var badgeLabelCenterSpacing: CGFloat
    
    var isLanguageLTR: Bool
    
    init() {
        badgeBackgroundColor = UIColor.red
        badgeTextColor = UIColor.white
        badgeBorderColor = UIColor.green
        badgeBorderWidth = 0.0
        badgeFont = UIFont.systemFont(ofSize: CGFloat(10))
        badgeTextTopBottomSpacing = 3
        badgeTextLeftRightSpacing = 3
        badgeMinHeight = 18
        badgeLabelTopSpacing = 1
        badgeLabelCenterSpacing = 4
        isLanguageLTR = true
    }
}
