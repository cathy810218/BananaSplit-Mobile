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
    func getCredientials() {
        let url = "https://api.dxhackathon.com/oauth2/token"
        let headers = ["Content-Type": "application/x-www-form-urlencoded",
                       "Accept": "application/json"];
        let params = ["client_id": client_id,
                      "client_secret": client_secret,
                      "grant_type": grant_type];
        Alamofire.request(
            url,
            method: .post,
            parameters: params,
            encoding: URLEncoding(destination: .queryString),
            headers: headers)
        .responseJSON { (response) in
            if let JSON = response.result.value as? [String: Any] {
               let accessToken = JSON["access_token"] as! String
                print(accessToken)
                UserDefaults.standard.setValue(accessToken, forKey: "access_token")
            }
        }
    }

    func listAccounts(callback: @escaping (String?, [Account]?) -> Void) {
        let url = "https://api.dxhackathon.com/money-movement/accounts"
        let accessToken = UserDefaults.standard.string(forKey: "access_token")
        let headers = ["Accept": "application/json;v=0",
                       "Authorization": "Bearer " + accessToken!]

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
                    print(response)
                    if (response.error != nil) {
                        callback("Error! \(response.description)", nil);
                    }

                    if let accounts = JSON["accounts"] as? [Dictionary<String, Any>] {
                        for accountObject in accounts {
                            accountsArray.append(Account(json: accountObject))
                        }
                    }
                    callback(nil, accountsArray);
                }
        }
    }
}
