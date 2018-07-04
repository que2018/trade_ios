//
//  TabBarController.swift
//  Trade
//
//  Created by jiusite on 5/3/18.
//  Copyright © 2018 Coin Inc. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keep original image
        for item in tabBar.items!
        {
            let tabBarItem = item as! UITabBarItem
            tabBarItem.image = tabBarItem.image!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
