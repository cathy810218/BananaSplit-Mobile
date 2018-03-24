//
//  CreateAccountViewController.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.brown


        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        let imageSize = CGSize(width: 80, height: 50)
        let marginX = ((self.navigationController?.navigationBar.frame.size.width)! / 2) - (imageSize.width / 2);
        imageView.frame = CGRect(x: marginX, y: 0, width: imageSize.width, height: imageSize.height)
        self.navigationController?.navigationBar.addSubview(imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
