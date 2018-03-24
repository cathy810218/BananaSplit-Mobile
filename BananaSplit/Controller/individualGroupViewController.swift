//
//  individualGroupViewController.swift
//  BananaSplit
//
//  Created by Arrido Arfiadi on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class individualGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var label: UILabel!

    var users : [User] = []
    var label1 = ""
    var bananaImgs: [UIImage] = []
    var debts: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MemberTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "MemberCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        label.text! = label1
        loadMockData()
        self.debts = ["$20", "$10", "$40", "$30"]
        self.bananaImgs = [UIImage(named: "banana1")!, UIImage(named: "banana2")!, UIImage(named: "banana3")!, UIImage(named: "banana1")!]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func requestAction(_ sender: Any) {
        let nums = [20, 10, 40, 30]
        var bodies = [Dictionary<String, Any>]()
        for (i, user) in users.enumerated() {
            user.ammountToPay = nums[i] as NSNumber
            
            if i == 0 {
                continue
            }
            let money = user.ammountToPay?.intValue
            
//            let body =
//                [ "originMoneyMovementAccountReferenceId": user.accId,
//                  "destinationMoneyMovementAccountReferenceId": users[0].accId,
//                  "transferAmount": money!,
//                  "currencyCode": "USD",
//                  "transferDate": "{{timestamp}}",
//                  "memo": "for investments",
//                  "transferType": "Internal",
//                  "frequency": "OneTime"
//                    ] as [String : Any]
//            API().internalTransfer(body: body, callback: { (errorMessage, <#String?#>) in
//                <#code#>
//            })
        }
        
    }
    
    
    func loadMockData() {
        if let path = Bundle.main.path(forResource: "Users", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, Any>
                if let users = jsonResult!["users"] as? [Dictionary<String, Any>] {
                    for user in users {
                        self.users.append(User(json: [
                            "name": user["name"] ?? "",
                            "id": user["id"] ?? -1,
                            "accId": user["accId"] ?? "N/A"]))
                    }
                }

            } catch {
                // handle error
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberTableViewCell
        cell.nameLabel.text = self.users[indexPath.row].name
        cell.bananaImageView!.image = self.bananaImgs[indexPath.row]
        cell.splitAmountLabel.text = self.debts[indexPath.row]
        return cell
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
