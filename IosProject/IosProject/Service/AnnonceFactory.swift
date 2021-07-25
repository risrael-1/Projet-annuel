//
//  AnnonceFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class AnnonceFactory {
    public static func annonceFromDict(_ dict: [String: Any]) -> Annonce? {
        guard let user_id = dict["user_id"] as? String,
              let title = dict["title"] as? String,
              let desc = dict["description"] as? String,
              let phone = dict["phone"] as? String,
              let email = dict["email"] as? String,
              let category = dict["category"] as? String,
              let contact = dict["contact"] as? String,
              let address = dict["address"] as? String,
              let date = dict["date"] as? String,
              let time = dict["time"] as? String,
              let status = dict["status"] as? String else{
            return nil
        }
        
        let id = dict["_id"] as? String
        
        return Annonce(id: id, user_id: user_id, title: title, category: category, desc: desc, phone: phone, email: email, contact: contact, address: address, date: date, time: time, status: status)
    }
}
