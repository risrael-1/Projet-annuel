//
//  UserFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class UserFactory {
    public static func userFromDictionary(_ dict: [String: Any]) -> User? {
        guard let fullName = dict["fullName"] as? String,
              let email = dict["email"] as? String,
              let createdAt = dict["createdAt"] as? String,
              let type = dict["type"] as? String else{
            return nil
        }
        
        let id = dict["_id"] as? String
        let picLink = dict["picLink"] as? String
        let phoneNumber = dict["phoneNumber"] as? String
        let address = dict["adress"] as? String
        let city = dict["city"] as? String
        
        return User(id: id, fullName: fullName, phoneNumber: phoneNumber, email: email, createdAt: createdAt, type: type, address: address, city: city, picLink: picLink)
    }
}
