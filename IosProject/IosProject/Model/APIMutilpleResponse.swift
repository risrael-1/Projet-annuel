//
//  APIMutilpleResponse.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//
import Foundation

class APIMultipleResponse: CustomStringConvertible {
    
    var success: Bool
    var requestCode: Int
    var errorMessage: String?
    var response: [[String: Any]]
    var description: String {
        "API-Response [\(self.success), \(self.errorMessage ?? "No error"), \(self.requestCode), \(self.response)]"
    }

    public init(success: Bool, requestCode: Int, errorMessage: String?, response: [[String: Any]]){
        self.success = success
        self.requestCode = requestCode
        self.errorMessage = errorMessage
        self.response = response
    }

}
