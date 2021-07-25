//
//  APIResponse.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class APIResponse {
    
    var success: Bool
    var requestCode: Int
    var error: String?
    var description: String {
        "API-Response [\(self.success), \(self.error ?? "No error"), \(self.requestCode)]"
    }

    public init(success: Bool, requestCode: Int, errorMessage: String?){
        self.success = success
        self.requestCode = requestCode
        self.error = errorMessage
    }
    
}
