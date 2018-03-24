//
//  FoundationExtension.swift
//  BananaSplit
//
//  Created by Cathy Oun on 3/24/18.
//  Copyright © 2018 Cathy Oun. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func getAccessToken() -> String? {
        guard let token = UserDefaults.standard.string(forKey: "access_token") else {
            return nil
        }
        return token
    }
    
    func save(accessToken: String) -> Bool {
        UserDefaults.standard.set(accessToken, forKey: "access_token")
        return UserDefaults.standard.synchronize()
    }
}
