//
//  user.swift
//  IosProject
//
//  Created by Raphael on 23/07/2021.
//

import Foundation


class User: CustomStringConvertible {
    
    var id: Int?
    var username: String
    var password: String
    var city: String
    var telNumber: String
    var nom: String
    var prenom: String
    var age: String
    var description: String {
        return "User [\(self.id ?? 0), \(self.username), \(self.password), \(self.city), \(self.telNumber), \(self.nom), \(self.prenom), \(self.age)]"
    }
    
    public init(id: Int?, username: String, password: String, city: String, telNumber: String, nom: String, prenom: String, age: String) {
        self.id = id
        self.username = username
        self.password = password
        self.city = city
        self.telNumber = telNumber
        self.nom = nom
        self.prenom = prenom
        self.age = age
    }
}
