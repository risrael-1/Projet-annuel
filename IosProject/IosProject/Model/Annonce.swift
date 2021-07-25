//
//  Annonce.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class Annonce {
    var id: String?
    var user_id: String
    var title: String
    var category: String
    var desc: String
    var phone: String
    var email: String
    var contact: String
    var address: String
    var date: String
    var time: String
    var status: String
    var description: String {
        return "Annonce [\(self.id ?? "") \(self.user_id), \(self.title), \(self.category), \(self.desc), \(self.phone), \(self.email), \(self.contact), \(self.address), \(self.date), \(self.time), \(self.status)]"
    }
    
    public init(id: String?, user_id: String, title: String, category: String, desc: String, phone: String, email: String, contact: String, address: String, date: String, time: String, status: String) {
        self.id = id
        self.user_id = user_id
        self.title = title
        self.category = category
        self.desc = desc
        self.phone = phone
        self.email = email
        self.contact = contact
        self.address = address
        self.date = date
        self.time = time
        self.status = status
    }
    
}
