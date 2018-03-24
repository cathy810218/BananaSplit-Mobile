//
//  LandingViewController.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/23/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class LandingViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API().getCredientials();
        // Do any additional setup after loading the view.
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
