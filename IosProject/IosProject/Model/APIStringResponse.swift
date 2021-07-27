//
//  APIStringResponse.swift
//  IosProject
//
//  Created by Eduard Serban on 26/07/2021.
//

import Foundation

class APIStringResponse: CustomStringConvertible {
    var success: Bool
    var requestCode: Int
    var error: String?
    var response: String?
    var description: String {
        "API-Response [\(self.success), \(self.error ?? "No error"), \(self.requestCode), \(self.response ?? "")]"
    }

    public init(success: Bool, requestCode: Int, errorMessage: String?, response: String?){
        self.success = success
        self.requestCode = requestCode
        self.error = errorMessage
        self.response = response
    }
}
