//
//  AccountViewController.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var accounts : [Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "AccountCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "AccountCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        self.accounts = []
        API().getCredientials()
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
                print(self.accounts)
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
        cell.availableBalance.text = accounts[indexPath.row].availableBalance?.stringValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}
