//
//  APIResponseFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class APIResponseFactory {
    public static func responseFromElement(_ dict: [String: Any]) -> APIResponse? {
        guard let success = dict["success"] as? Bool,
              let requestCode = dict["requestCode"] as? Int else {
            return nil
        }
        
        let errorMessage = dict["error"] as? String
        return APIResponse(success: success, requestCode: requestCode, errorMessage: errorMessage)
        
    }
}
