//
//  InternalTransferDetail.swift
//  BananaSplit
//
//  Created by Gores, Chris on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import Foundation

class InternalTransferDetail {
    var json: [String : Any]
    var transferRequestId: String?
    var originMoneyMovementAccountReferenceId: String?
    var destinationMoneyMovementAccountReferenceId: String?
    var transferAmount: Int?
    var currencyCode: String?
    var transferDate: Date?
    var memo: String?
    var transferType: String?
    var frequency: String?
    var transferRequestStatus: String?
    
    init(json: [String: Any]) {
        self.json = json
        self.transferRequestId = json["transferRequestId"] as? String
        self.originMoneyMovementAccountReferenceId = json["originMoneyMovementAccountReferenceId"] as? String
        self.destinationMoneyMovementAccountReferenceId = json["destinationMoneyMovementAccountReferenceId"] as? String
        self.transferAmount = json["transferAmount"] as? Int
        self.currencyCode = json["currencyCode"] as? String
        self.transferDate = json["transferDate"] as? Date
        self.memo = json["memo"] as? String
        self.transferType = json["transferType"] as? String
        self.frequency = json["frequency"] as? String
        self.transferRequestStatus = json["transferRequestStatus"] as? String
    }
    
    var description: String {
        return "\(json)"
    }
}
