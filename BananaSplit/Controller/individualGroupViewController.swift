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

    var users : [User] = []
    var label1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text! = label1
        loadMockData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadMockData() {
        if let path = Bundle.main.path(forResource: "Users", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, Any>
                if let users = jsonResult!["users"] as? [Dictionary<String, Any>] {
                    for user in users {
                        self.users.append(User(json: ["name": user["name"], "id": user["id"] ?? -1]))
                    }
                }

            } catch {
                // handle error
            }
        }
    }

    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
