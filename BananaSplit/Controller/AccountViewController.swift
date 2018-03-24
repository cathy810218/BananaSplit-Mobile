//
//  AccountViewController.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var accounts : [Account] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "AccountCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "AccountCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 50
        self.accounts = []
        // ignore credential call for now. Credentials last 2 weeks which is more than enough time for demo.
        // TODO: update API calls to include parameter for credentials and remove credentials from constants.
        // API().getCredientials()
        loadMockData()
    }
    
    func loadMockData() {
        API().listAccounts { (errorMessage, accounts) in
            if (errorMessage != nil) {
                print(errorMessage!)
                return
            }
            if (accounts != nil) {
                self.accounts = accounts!
                for account in accounts as! [Account] {
                    print(account.description)
                }
                self.tableView.reloadData()
            }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : AccountCell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        cell.nameLabel.text = accounts[indexPath.row].accountNickname
        cell.availableBalance.text = "$ " + (accounts[indexPath.row].availableBalance?.stringValue ?? "0.00")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}
