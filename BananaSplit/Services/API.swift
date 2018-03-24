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
        let params = ["client_id": client_id, "client_secret": client_secret];
        Alamofire.request("https://api.dxhackathon.com/oauth2/token", method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (data) in
            print(data);
        }
//        UserDefaults.standard.setValue(token, forKey: "access_token")
    }
}
