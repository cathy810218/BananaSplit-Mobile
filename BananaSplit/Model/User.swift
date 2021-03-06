//
//  User.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/23/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import Foundation

class User {
    var json: [String : Any]
    var id: NSNumber?
    var name: String?
    var ammountToPay: NSNumber?
    var accId: String?
    var transferId: String?
    var transferType: String?
    init(json: [String: Any]) {
        self.json = json
        self.id = json["id"] as? NSNumber ?? 0
        self.name = json["name"] as? String ?? ""
        self.ammountToPay = 0
        self.accId = json["accId"] as? String ?? ""
        self.transferType = json["transferType"] as? String ?? ""
        self.transferId = nil
    }
    
    var description: String {
        return "\(json)"
    }
}
