//
//  Account.swift
//  BananaSplit
//
//  Created by Adrian Prananda on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import Foundation

class Account {
    var accountNickname: String?;
    var bankName: String?;
    var productName: String?;
    var lastFourAccountNumber: NSNumber?;
    var availableBalance: NSNumber?;
    init(json: [String: Any]) {
        self.accountNickname = json["accountNickname"] as? String
        self.bankName = json["bankName"] as? String
        self.productName = json["productName"] as? String
        self.lastFourAccountNumber = json["lastFourAccountNumber"] as? NSNumber
        self.availableBalance = json["availableBalance"] as? NSNumber
    }
}
