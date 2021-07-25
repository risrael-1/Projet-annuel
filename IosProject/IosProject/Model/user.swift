//
//  user.swift
//  IosProject
//
//  Created by Raphael on 23/07/2021.
//

import Foundation


class User: CustomStringConvertible {
    
    var id: String?
    var fullName: String
    var phoneNumber: String?
    var email: String
    var createdAt: String
    var type: String
    var address: String?
    var city: String?
    var picLink: String?
    var description: String {
        return "User [\(self.id ?? "") \(self.fullName), \(self.phoneNumber ?? ""), \(self.email), \(self.type), \(self.address ?? ""), \(self.city ?? "")]"
    }
    
    public init(id: String?, fullName: String, phoneNumber: String?, email: String, createdAt: String, type: String, address: String?, city: String?, picLink: String?) {
        self.id = id
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.email = email
        self.createdAt = createdAt
        self.type = type
        self.address = address
        self.city = city
        self.picLink = picLink
    }
}
