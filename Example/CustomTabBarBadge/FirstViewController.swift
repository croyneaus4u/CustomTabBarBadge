//
//  FirstViewController.swift
//  CustomTabBarBadge
//
//  Created by croyneaus4u on 23/02/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import CustomTabBarBadge

class FirstViewController: UIViewController {
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(updateBadge))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateBadge () {
        count = count + 1
        
        tabBarItem.setTabBadgeValue("\(count)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
