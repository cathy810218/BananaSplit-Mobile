//
//  individualGroupViewController.swift
//  BananaSplit
//
//  Created by Arrido Arfiadi on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class individualGroupViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var label1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text! = label1
        // Do any additional setup after loading the view.
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
