//
//  ApiService.swift
//  IosProject
//
//  Created by Eduard Serban on 25/07/2021.
//

import Foundation

class ApiService {
    public func getUserInfos(userId: String, token: String, completion: @escaping (User?) -> Void) -> Void {
        guard let url = URL(string: "https://benevold.herokuapp.com/user?type=ios") else {
            completion(nil)
            return
        }
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        let body = [
            "user_id": userId
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let reponseBody = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let user = reponseBody as? [String:Any] else {
                completion(nil)
                return
            }
            guard let apiResponse = APISingleResponseFactory.responseFromElement(user) else {
                completion(nil)
                return
            }
            
            let res = UserFactory.userFromDictionary(apiResponse.response)
            completion(res)
        }
        task.resume() // Lance le telechargement
    }
    
    public func signin(login: String?, password: String?, completion: @escaping (APISigninResponse?) -> Void) -> Void {
        guard let url = URL(string: "https://benevold.herokuapp.com/auth/signin?type=ios") else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dict = ["login": login, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
            }
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let reponseBody = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let apiResponseBody = reponseBody as? [String:Any] else {
                completion(nil)
                return
            }
            guard let apiResponse = APISigninResponseFactory.responseFromElement(apiResponseBody) else {
                completion(nil)
                return
            }
            completion(apiResponse)
            
        }
        task.resume()
    }
    
    public func updateUser(user: User, token: String, completion: @escaping (Bool) -> Void) -> Void {
        guard let url = URL(string: "https://benevold.herokuapp.com/user?type=ios") else {
            completion(false)
            return
        }
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = headers
        let body = [
            "id_user": user.id!,
            "nom": user.fullName,
            "address": user.address!,
            "city": user.city!,
            "number": user.phoneNumber!,
            "email": user.email,
            "picLink": user.picLink?.count == 0 ? "no image" : user.picLink!
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        print(body)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(false)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let reponseBody = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let apiResponses = reponseBody as? [String:Any] else {
                completion(false)
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(apiResponses) else {
                completion(false)
                return
            }
            print(apiResponse.success)
            completion(apiResponse.success)
        }
        task.resume() // Lance le telechargement
    }
    
    public func getAnnonces(token: String, completion: @escaping ([Annonce]) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/annonces?type=ios") else {
            completion([])
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion([])
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let annonceAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let annonces = annonceAny as? [String:Any] else {
                completion([])
                return
            }
            guard let apiResponse = APIMultipleResponseFactory.responseFromElement(annonces) else {
                completion([])
                return
            }
            let res = apiResponse.response.compactMap(AnnonceFactory.annonceFromDict(_:))
            completion(res)
        }
        task.resume()
    }
    
    public func getUserById(token: String, userId: String, completion: @escaping (User?) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/user?id=\(userId)") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let userAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let user = userAny as? [String:Any] else {
                completion(nil)
                return
            }
            print(user)
            guard let apiResponse = APISingleResponseFactory.responseFromElement(user) else {
                completion(nil)
                return
            }
            let res = UserFactory.userFromDictionary(apiResponse.response)
            completion(res)
        }
        task.resume()
    }
    
    public func getAnnonceInfos(token: String, annonceId: String, completion: @escaping (Annonce?) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/annonce") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        let body = [
            "annonce_id": annonceId
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        print(body)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let annonceAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let annonce = annonceAny as? [String:Any] else {
                completion(nil)
                return
            }
            guard let apiResponse = APISingleResponseFactory.responseFromElement(annonce) else {
                completion(nil)
                return
            }
            
            let res = AnnonceFactory.annonceFromDict(apiResponse.response)
            completion(res)
        }
        task.resume()
    }
    
    public func getMessage(token: String, completion: @escaping (String) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/message") else {
            completion("")
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion("")
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let annonceAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let annonce = annonceAny as? [String:Any] else {
                completion("")
                return
            }
            guard let apiResponse = APIStringResponseFactory.responseFromElement(annonce) else {
                completion("")
                return
            }
            completion(apiResponse.response ?? "")
        }
        task.resume()
    }
    
    public func setTakenBy(token: String, annonce_id: String, user_id: String, completion: @escaping (Bool) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/annonce/taken") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        let body = [
            "annonce_id": annonce_id,
            "user_id": user_id
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(false)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let apiResponseAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let apiResponses = apiResponseAny as? [String:Any] else {
                completion(false)
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(apiResponses) else {
                completion(false)
                return
            }
            completion(apiResponse.success)
        }
        task.resume()
    }
    
    public func getAnnonceTakenByUserId(token: String, userId: String, completion: @escaping (Annonce?) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/annonce/taken/user?id=\(userId)") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let userAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let user = userAny as? [String:Any] else {
                completion(nil)
                return
            }
            print(user)
            guard let apiResponse = APISingleResponseFactory.responseFromElement(user) else {
                completion(nil)
                return
            }
            print(apiResponse)
            let res = AnnonceFactory.annonceFromDict(apiResponse.response)
            completion(res)
        }
        task.resume()
    }
    
    public func countAnnoncesByDateAndTakenBy(token: String, date: String, completion: @escaping (Int) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/flutter/count/annonces/taken/user/date?date=\(date)") else {
            completion(0)
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(0)
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let userAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let user = userAny as? [String:Any] else {
                completion(0)
                return
            }
            print(user)
            guard let apiResponse = APIIntegerResponseFactory.responseFromElement(user) else {
                completion(0)
                return
            }
            completion(apiResponse.response ?? 0)
        }
        task.resume()
    }
    
    public func getAnnoncesByTakenAndDate(token: String, date: String, completion: @escaping ([Annonce]) -> Void) -> Void {
        
        let headers = [
            "access-token": token,
            "Content-Type": "application/json"
        ]
        
        guard let url = URL(string: "https://benevold.herokuapp.com/annonces/taken/user/date?date=\(date)") else {
            completion([])
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion([])
                return
                
            }
            
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let annonceAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let annonces = annonceAny as? [String:Any] else {
                completion([])
                return
            }
            guard let apiResponse = APIMultipleResponseFactory.responseFromElement(annonces) else {
                completion([])
                return
            }
            print(apiResponse)
            let res = apiResponse.response.compactMap(AnnonceFactory.annonceFromDict(_:))
            completion(res)
        }
        task.resume()
    }
    
    public func signup(fullName: String?, email: String?, password: String?, completion: @escaping (APISigninResponse?) -> Void) -> Void {
        guard let url = URL(string: "https://benevold.herokuapp.com/auth/signup?type=ios") else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dict = ["fullName": fullName, "email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(nil)
                return
            }
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let reponseBody = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let apiResponseBody = reponseBody as? [String:Any] else {
                completion(nil)
                return
            }
            guard let apiResponse = APISigninResponseFactory.responseFromElement(apiResponseBody) else {
                completion(nil)
                return
            }
            completion(apiResponse)
            
        }
        task.resume()
    }
    
    public func forgottenPasswordEmailConfirmation(email: String?, completion: @escaping (String) -> Void) -> Void {
        guard let url = URL(string: "https://benevold.herokuapp.com/auth/password/email?type=ios") else {
            completion("")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dict = ["email": email]
        request.httpBody = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion("")
                return
            }
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let reponseBody = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let apiResponseBody = reponseBody as? [String:Any] else {
                completion("")
                return
            }
            
            completion(apiResponseBody["user_id"] as? String ?? "")
            
        }
        task.resume()
    }
    
    public func resetPassword(userId: String, newPassword: String?, completion: @escaping (Bool) -> Void) -> Void {
        guard let url = URL(string: "https://benevold.herokuapp.com/auth/password/new?type=ios") else {
            completion(false)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dict = ["user_id": userId, "new_password": newPassword]
        request.httpBody = try? JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard err == nil, let d = data else {
                completion(false)
                return
            }
            // try? -> permet de renvoyer nil cas d'erreur de la fonction jsonObject
            let reponseBody = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let apiResponseBody = reponseBody as? [String:Any] else {
                completion(false)
                return
            }
            guard let apiResponse = APIResponseFactory.responseFromElement(apiResponseBody) else {
                completion(false)
                return
            }
            completion(apiResponse.success)
            
        }
        task.resume()
    }
}


