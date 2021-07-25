//
//  APISigninResponse.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class APISigninResponse {
    
    var success: Bool
    var requestCode: Int
    var errorMessage: String?
    var token: String?
    var userId: String?
    var description: String {
        "API-Response [\(self.success), \(self.errorMessage ?? "No error"), \(self.requestCode), \(self.token ?? "none"), \(self.userId ?? "none")]"
    }

    public init(success: Bool, requestCode: Int, errorMessage: String?, token: String?, userId: String?){
        self.success = success
        self.requestCode = requestCode
        self.errorMessage = errorMessage
        self.token = token
        self.userId = userId
    }
    
}
