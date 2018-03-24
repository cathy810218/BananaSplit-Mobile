//
//  API.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import Foundation
import Alamofire

class API {
    func getCredientials(callback: @escaping (String?, String?) -> Void) {
        let url = "https://api.dxhackathon.com/oauth2/token"
        let headers = ["Content-Type": "application/x-www-form-urlencoded",
                       "Accept": "application/json"];
        let body = ["client_id": client_id,
                      "client_secret": client_secret,
                      "grant_type": grant_type];
        Alamofire.request(
            url,
            method: .post,
            parameters: body,
            encoding: URLEncoding(destination: .queryString),
            headers: headers)
        .responseJSON { (response) in
            if let JSON = response.result.value as? [String: Any] {
                // parse error and callback if error exists.
                if (response.error != nil) {
                    callback("Error! \(response.description)", nil);
                }
                let accessToken = JSON["access_token"] as? String
                callback(nil, accessToken)
            }
        }
    }
    
    func listAccounts(callback: @escaping (String?, [Account]?) -> Void) {
        let url = "https://api.dxhackathon.com/money-movement/accounts"
        let accessToken = access_token
        let headers = ["Accept": "application/json;v=0",
                       "Authorization": "Bearer " + accessToken]
        
        var accountsArray: [Account] = [];

        // build and send request
        Alamofire.request(
            url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding(destination: .queryString),
            headers: headers)
        .responseJSON { (response) in
            if let JSON = response.result.value as? [String: Any] {
                // parse error and callback if error exists.
                if (response.error != nil) {
                    callback("Error! \(response.description)", nil);
                }
                // populate list of accounts and callback.
                if let accounts = JSON["accounts"] as? [Dictionary<String, Any>] {
                    for accountObject in accounts {
                        accountsArray.append(Account(json: accountObject))
                    }
                }
                callback(nil, accountsArray);
            }
        }
    }
    
    func internalTransfer(body: [String: Any],  callback: @escaping (String?, String?) -> Void) {
        let url = "https://api.dxhackathon.com/money-movement/transfer-requests"
        let accessToken = access_token
        let headers = ["Content-Type": "application/json",
                       "Accept": "application/json;v=0",
                       "Authorization": "Bearer " + accessToken]
        
        // build and send request
        Alamofire.request(
            url,
            method: .post,
            parameters: body,
            encoding: JSONEncoding.default,
            headers: headers)
            .responseJSON { (response) in
                if let JSON = response.result.value as? [String: Any] {
                    // parse error and callback if error exists.
                    if (response.error != nil) {
                        callback("Error! \(response.description)", nil);
                    }
                    let transferRequestId = JSON["transferRequestId"] as? String
                    callback(nil, transferRequestId);
                }
        }
    }
    
    func internalTransferDetails(transferReqId: String,  callback: @escaping (String?, InternalTransferDetail?) -> Void) {
        let url = "https://api.dxhackathon.com/money-movement/transfer-requests/" + transferReqId
        let accessToken = access_token
        let headers = ["Accept": "application/json;v=0",
                       "Authorization": "Bearer " + accessToken]
        
        // build and send request
        Alamofire.request(
            url,
            method: .get,
            parameters: nil,
            encoding: URLEncoding(destination: .queryString),
            headers: headers)
            .responseJSON { (response) in
                if let JSON = response.result.value as? [String: Any] {
                    // parse error and callback if error exists.
                    if (response.error != nil) {
                        callback("Error! \(response.description)", nil);
                    }
                    let transferDetail = InternalTransferDetail(json: JSON)
                    callback(nil, transferDetail);
                }
        }
    }
}
