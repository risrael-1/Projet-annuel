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
            print(res)
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
            let annonceAny = try? JSONSerialization.jsonObject(with: d, options: .allowFragments)
            guard let annonces = annonceAny as? [String:Any] else {
                completion(nil)
                return
            }
            guard let apiResponse = APISingleResponseFactory.responseFromElement(annonces) else {
                completion(nil)
                return
            }
            let res = UserFactory.userFromDictionary(apiResponse.response)
            completion(res)
        }
        task.resume()
    }
    
}


