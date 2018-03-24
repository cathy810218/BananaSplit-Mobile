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
    var nums: [Int] = []
    
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
        self.nums = [20, 10, 40, 30]
        self.bananaImgs = [UIImage(named: "banana1")!, UIImage(named: "banana2")!, UIImage(named: "banana3")!, UIImage(named: "banana1")!]
        
        // Do any additional setup after loading the view.
    }

    @IBAction func rouletteAction(_ sender: Any) {
    }
    
    @IBAction func requestAction(_ sender: Any) {
        for i in 1...nums.count - 1 {
            if (self.users[i].transferId != nil) {
                continue
            }
            users[i].ammountToPay = nums[i] as NSNumber
            
            let money = users[i].ammountToPay?.intValue
            
            let body =
                [ "originMoneyMovementAccountReferenceId": users[i].accId ?? "",
                  "destinationMoneyMovementAccountReferenceId": users[0].accId ?? "",
                  "transferAmount": money!,
                  "currencyCode": "USD",
                  "transferDate": "2018-03-24",
                  "memo": "for investments",
                  "transferType": users[i].transferType ?? "",
                  "frequency": "OneTime"
//                [
//                    "originMoneyMovementAccountReferenceId": "YHGRB+zRxznmdsOV7QpZE5Ba25ut5nliF486mFhNgk=",
//                    "destinationMoneyMovementAccountReferenceId": "XFhWXJQOVdudjhONmdsOV7QpZE5Ba25ut5pa0N75jjoLJh=",
//                    "transferAmount": 10,
//                    "currencyCode": "USD",
//                    "transferDate": "2018-03-24",
//                    "memo": "for investments",
//                    "transferType": "Internal",
//                    "frequency": "OneTime"
            
                    ] as [String : Any]
            
          API().internalTransfer(body: body, callback: { (errorMessage, transferRequestId) in
                if (errorMessage != nil) {
                    print(errorMessage!)
                    return
                }
                self.users[i].transferId = transferRequestId
                if i == self.nums.count - 1 {
                    self.tableView.reloadData()
                }
          })
        }
        
    }
    
    
    func loadMockData() {
        if let path = Bundle.main.path(forResource: "Users", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Dictionary<String, Any>
                if let users = jsonResult!["users"] as? [Dictionary<String, Any>] {
                    for user in users {
                        self.users.append(User(json: user))
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
