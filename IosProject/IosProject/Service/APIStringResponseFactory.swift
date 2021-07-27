//
//  APIStringResponseFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 26/07/2021.
//

import Foundation


class APIStringResponseFactory {
    public static func responseFromElement(_ dict: [String: Any]) -> APIStringResponse? {
        guard let success = dict["success"] as? Bool,
              let requestCode = dict["requestCode"] as? Int else {
            return nil
        }
        
        let errorMessage = dict["error"] as? String
        let response = dict["response"] as? String
        return APIStringResponse(success: success, requestCode: requestCode, errorMessage: errorMessage, response: response)
        
    }
}
