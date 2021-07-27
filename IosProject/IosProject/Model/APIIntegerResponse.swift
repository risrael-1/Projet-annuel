//
//  APIIntegerResponse.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import Foundation


class APIIntegerResponse: CustomStringConvertible {
    var success: Bool
    var requestCode: Int
    var error: String?
    var response: Int?
    var description: String {
        "API-Response [\(self.success), \(self.error ?? "No error"), \(self.requestCode), \(self.response ?? 0)]"
    }

    public init(success: Bool, requestCode: Int, errorMessage: String?, response: Int?){
        self.success = success
        self.requestCode = requestCode
        self.error = errorMessage
        self.response = response
    }
}
