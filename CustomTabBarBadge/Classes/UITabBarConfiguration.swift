//
//  UITabBarConfiguration.swift
//  TabDemo
//
//  Created by labkumar.singh on 07/02/17.
//  Copyright © 2017 labkumar.singh. All rights reserved.
//

import Foundation
import UIKit

public protocol UITabbarItemBadgeConfiguration {
    
    var badgeBackgroundColor: UIColor { get set }
    var badgeTextColor: UIColor { get set }
    var badgeBorderColor: UIColor { get set }
    
    var badgeBorderWidth: CGFloat { get set }
    
    var badgeFont: UIFont { get set }
    
    var badgeTextTopBottomSpacing: CGFloat { get set }
    var badgeTextLeftRightSpacing: CGFloat { get set }
    var badgeMinHeight: CGFloat { get set }
    
    var badgeLabelTopSpacing: CGFloat { get set }
    var badgeLabelCenterSpacing: CGFloat { get set }
    
    var isLanguageLTR: Bool { get set }
    
}
