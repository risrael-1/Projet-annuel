//
//  APISingleResponseFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class APISingleResponseFactory {
    public static func responseFromElement(_ dict: [String: Any]) -> APISingleResponse? {
        guard let success = dict["success"] as? Bool,
              let requestCode = dict["requestCode"] as? Int,
              let response = dict["response"] as? [String: Any] else {
            return nil
        }
        
        let errorMessage = dict["errorMessage"] as? String
        return APISingleResponse(success: success, requestCode: requestCode, errorMessage: errorMessage, response: response)
    }
}
