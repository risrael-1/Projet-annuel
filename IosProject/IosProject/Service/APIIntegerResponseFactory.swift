//
//  APIIntegerResponseFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 27/07/2021.
//

import Foundation


class APIIntegerResponseFactory {
    public static func responseFromElement(_ dict: [String: Any]) -> APIIntegerResponse? {
        guard let success = dict["success"] as? Bool,
              let requestCode = dict["requestCode"] as? Int else {
            return nil
        }
        
        let errorMessage = dict["error"] as? String
        let response = dict["response"] as? Int
        return APIIntegerResponse(success: success, requestCode: requestCode, errorMessage: errorMessage, response: response)
        
    }
}
