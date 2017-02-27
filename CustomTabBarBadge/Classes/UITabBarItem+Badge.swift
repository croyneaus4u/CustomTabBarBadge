//
//  UITabBarItem+Badge.swift
//  TabDemo
//
//  Created by croyneaus4u on 07/02/17.
//  Copyright © 2017 croyneaus4u. All rights reserved.
//

import Foundation
import UIKit

fileprivate class TabBarDataHandler {
    var customBadgeLabels = [String: UILabel]()
    var respectiveTabbars = [String: UIView]()
}

fileprivate let UITabbarCustomBadgeConst = "UITABBAR_CUSTOMBADGE_CONST"
fileprivate var badgeAnimationProvider: UITabbarItemBadgeAnimation?
fileprivate var badgeConfigurationProvider: UITabbarItemBadgeConfiguration?
fileprivate let dataHandler = TabBarDataHandler()

fileprivate extension UITabBarItem {
    
    // Instance methods
    
    func getHashString () -> String {
        return "\(UInt(self.hash))"
    }
    
    func getCustomBadgeForCurrentTabbarItem () -> UILabel? {
        return dataHandler.customBadgeLabels[getHashString()]
    }
    
    func initializeAnBadgeLabelAccordingToMacro () -> UILabel {
        let customBadge = UILabel()
        customBadge.textAlignment = .center
        
        applyBadgeConfiguration(customBadge)
        
        customBadge.isUserInteractionEnabled = false
        
        customBadge.clipsToBounds = true
        
        customBadge.alpha = 0.0
        customBadge.isHidden = true
        return customBadge
    }
    
    func getCachedTopTabbarView() -> UIView? {
        var tabbarView: UIView? = dataHandler.respectiveTabbars[getHashString()]
        if tabbarView == nil {
            var tabBarItemView = self.value(forKey: "view") as? UIView
            while tabBarItemView != nil {
                if (tabBarItemView is UITabBar) {
                    dataHandler.respectiveTabbars[getHashString()] = tabBarItemView
                    tabbarView = tabBarItemView
                    break
                }
                tabBarItemView = tabBarItemView?.superview
            }
        }
        return tabbarView!
    }
    
    func applyBadgeConfiguration (_ customBadge: UILabel) {
        customBadge.textColor = badgeConfigurationProvider?.badgeTextColor ?? UIColor.black
        customBadge.backgroundColor = badgeConfigurationProvider?.badgeBackgroundColor ?? UIColor.blue
        customBadge.layer.borderColor = badgeConfigurationProvider?.badgeBorderColor.cgColor ?? UIColor.black.cgColor
        customBadge.layer.borderWidth = badgeConfigurationProvider?.badgeBorderWidth ?? 0.0
        customBadge.font = badgeConfigurationProvider?.badgeFont ?? UIFont.systemFont(ofSize: 15)
    }
    
    func sizingBadgeLabel(_ customBadge: UILabel, accordingToMacrosAndMsg msg: String, inTabbar tabbarItemView: UIView) -> CGSize {
        let minHeight: CGFloat = badgeConfigurationProvider?.badgeMinHeight ?? 0
        let topBottomSpacing: CGFloat = badgeConfigurationProvider?.badgeTextTopBottomSpacing ?? 0
        let leftRightSpacing: CGFloat = badgeConfigurationProvider?.badgeTextLeftRightSpacing ?? 0
        let badgeLabelCenterSpacing: CGFloat = badgeConfigurationProvider?.badgeLabelCenterSpacing ?? 0
        let maximumSize = CGSize(width: CGFloat(tabbarItemView.frame.size.width - badgeLabelCenterSpacing), height: CGFloat(minHeight - 2 * topBottomSpacing))
        
        let updatedMsg: String = msg
        let rect: CGRect = updatedMsg.boundingRect(with: maximumSize, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSFontAttributeName: customBadge.font], context: nil)
        let height: CGFloat = rect.size.height + 2 * topBottomSpacing
        var width: CGFloat = rect.size.width + 2 * leftRightSpacing

        width = max(height, width)

        customBadge.layer.cornerRadius = min(width, height) / 2
        return CGSize(width: width, height: height)
    }
    
    
    func getFrameOfBadgeLabel(_ badgeSize: CGSize, inTabbar tabbarItemView: UIView) -> CGRect {
        var positionX: CGFloat
        var positionY: CGFloat
        let point = CGPoint.init(x: tabbarItemView.frame.minX, y: 1)
        
        positionX = point.x
        positionY = point.y
        
        let badgeLableRightSpacing: CGFloat = badgeConfigurationProvider?.badgeLabelCenterSpacing ?? 0
        let badgeLabelTopSpacing: CGFloat = badgeConfigurationProvider?.badgeLabelTopSpacing ?? 0
        
        let isLTR = badgeConfigurationProvider?.isLanguageLTR ?? false
        let widthOffset = isLTR ? 0 : badgeSize.width
        
        let centerOffset = (isLTR ? -1 : 1)*badgeLableRightSpacing
        
        positionX = positionX + tabbarItemView.frame.size.width/2.0 - centerOffset - widthOffset
        positionY = badgeLabelTopSpacing + positionY
        return CGRect(x: CGFloat(positionX), y: CGFloat(positionY), width: CGFloat(badgeSize.width), height: CGFloat(badgeSize.height))

    }
    
    func getOwnView () -> UIView? {
        return self.value(forKey: "view") as? UIView
    }
    
    func canshowBadge (forValue value: String?) -> Bool {
        if value == nil || value == "" || value == "0" {
            return false
        }
        
        return true
    }
}

fileprivate extension UITabBarItem {
    // Animation
    func callBadgeAnimationProviderAppearanceAnimationwithBadge(_ badgeLabel: UILabel, withValue msg: String, withCompletion completion: BadgeAnimationCompletionBlock?) {
        badgeAnimationProvider?.tabBarBageAppearAnimationWithBadge(badgeLabel, value: msg, completion: completion)
    }
    
    func callBadgeAnimationProviderDisappearanceAnimationwithBadge(_ badgeLabel: UILabel, withCompletion completion: BadgeAnimationCompletionBlock?) {
        badgeAnimationProvider?.tabBarBageDisappearAnimationWithBadge(badgeLabel, completion: completion)
    }
}

public extension UITabBarItem {
    
    public class func setDefaultAnimationProvider(_ animationProvider: UITabbarItemBadgeAnimation) {
        badgeAnimationProvider = animationProvider
    }
    
    public class func setDefaultConfigurationProvider(_ configurationProvider: UITabbarItemBadgeConfiguration) {
        badgeConfigurationProvider = configurationProvider
    }
    
    public func reloadBadgeConfiguration () {
        guard let customBadge = getCustomBadgeForCurrentTabbarItem() else {
            return
        }
        
        applyBadgeConfiguration(customBadge)
        
        let tabBarItemView = getOwnView()!
        
        let badgeSize = sizingBadgeLabel(customBadge, accordingToMacrosAndMsg: customBadge.text!, inTabbar: tabBarItemView)
        let badgeFrame = getFrameOfBadgeLabel(badgeSize, inTabbar: tabBarItemView)
        
        customBadge.frame = badgeFrame
    }
    
    // setters & getters
    public func tabBadgeValue() -> String? {
        let customBadge: UILabel? = self.getCustomBadgeForCurrentTabbarItem()
        return customBadge?.text
    }
    
    func setTabBadgeValue (_ value: String?) {
        setTabBadgeValue(value, withCompletion: nil)
    }
    
    func setTabBadgeValue (_ value: String?, withCompletion handler: BadgeAnimationCompletionBlock?) {
        var customBadge = getCustomBadgeForCurrentTabbarItem()
        
        if customBadge == nil {
            customBadge = initializeAnBadgeLabelAccordingToMacro()
            dataHandler.customBadgeLabels["\(UInt(self.hash))"] = customBadge
            
            let tabBarView = getCachedTopTabbarView()
            tabBarView?.addSubview(customBadge!)
            tabBarView?.bringSubview(toFront: customBadge!)
        }
        
        if canshowBadge(forValue: value) {
            let tabBarItemView = getOwnView()
            
            let badgeSize = sizingBadgeLabel(customBadge!, accordingToMacrosAndMsg: value!, inTabbar: tabBarItemView!)
            let badgeFrame = getFrameOfBadgeLabel(badgeSize, inTabbar: tabBarItemView!)
            customBadge?.frame = badgeFrame
            
            customBadge?.text = value
            customBadge?.isHidden = false
            customBadge?.alpha = 1.0
            
            callBadgeAnimationProviderAppearanceAnimationwithBadge(customBadge!, withValue: value!, withCompletion: handler)
        } else {
            callBadgeAnimationProviderDisappearanceAnimationwithBadge(customBadge!, withCompletion: {
                customBadge?.text = ""
                customBadge?.isHidden = true
                customBadge?.alpha = 0.0
                handler?()
            })
        }
    }
}
