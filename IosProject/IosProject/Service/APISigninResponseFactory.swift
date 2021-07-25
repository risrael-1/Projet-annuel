//
//  APISigninResponseFactory.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class APISigninResponseFactory {
    public static func responseFromElement(_ dict: [String: Any]) -> APISigninResponse? {
        guard let success = dict["success"] as? Bool,
              let requestCode = dict["requestCode"] as? Int else {
            return nil
        }
        
        let errorMessage = dict["errorMessage"] as? String
        let token = dict["token"] as? String
        let userId = dict["user_id"] as? String
        return APISigninResponse(success: success, requestCode: requestCode, errorMessage: errorMessage, token: token, userId: userId)
        
    }
}
