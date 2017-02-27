//
//  ArabicBadgeConfiguration.swift
//  TabDemo
//
//  Created by croyneaus4u on 08/02/17.
//  Copyright © 2017 croyneaus4u. All rights reserved.
//

import UIKit
import CustomTabBarBadge

class ArabicBadgeConfiguration: DefaultBadgeConfiguration {
    
    override init() {
        super.init()
        
        // override what you want here
        isLanguageLTR = false
    }
}
