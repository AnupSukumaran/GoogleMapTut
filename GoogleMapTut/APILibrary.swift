//
//  APILibrary.swift
//  Loqqat
//
//  Created by Sukumar Anup Sukumaran on 20/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import Foundation
import Alamofire

final class APILibrary {
    
    static let shared = APILibrary()
    private init(){}
    
    //MARK: Make Post Request
    func makePostRequest(url: URL, jsonBody: String) -> URLRequest {
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.httpBody = jsonBody.data(using: String.Encoding.utf8)
        
        return req
    }
    
//    //MARK: Make Post Request With Header
//    func makePostRequestWithHeader(url: URL, jsonBody: String) -> URLRequest {
//
//        var req = URLRequest(url: url)
//        req.httpMethod = "POST"
//        if let authID = GVars.authID {
//            req.addValue(authID, forHTTPHeaderField: Constants.Keys.ls)
//        }
//        req.httpBody = jsonBody.data(using: String.Encoding.utf8)
//
//        return req
//    }

    //MARK: Make Get Request
    func makeGetRequest(url: URL) -> URLRequest {
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
    
        return req
    }
    
//    //MARK: API-1 - POST - LOGIN API
//    func loginAPI(mobile: String, completion: @escaping ResultCompBlk)  {
// 
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.getLoginOtp)
//        let jsonBody = "{\"\(Constants.Keys.mobile)\":\"\(mobile)\"}"
//        
//        let request = makePostRequest(url: urlLink, jsonBody: jsonBody)
//        
//        Alamofire.request(request).validate().responseJSON { (response) in
//            guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
//                completion(.Error("Something went wrong!!.Please try again."))
//                return
//            }
//            
//            switch response.result {
//            case .success(let data):
//                
//                guard let jsonData = data as? JSON else {//Logger.print("jsonData😩");
//                    return}
//               
//                let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                guard let code = jsonData[Constants.Keys.code] as? String,  code == Constants.Keys.success else {completion(.Error(msg));return}
//                
//                let classResponse = ModelClassResponse(json: jsonData)
//                completion(.Success(classResponse))
//                
//            case .failure(let error):
//                
//                completion(.Error(error.localizedDescription))
//            }
//        }
//        
//        
//    }
    
//    //MARK: API-2 - GET - COUNTRY LIST API
//    func getCountryListApi(completion: @escaping ResultCompBlk) {
//
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.getcountries)
//
//        //Logger.print("URLLink = \(urlLink)")
//
//        Alamofire.request(urlLink, method: .get, parameters: [:]).validate().responseJSON { (response) in
//            switch response.result {
//
//                case .success(let data):
//
//                    guard let jsonData = data as? JSON else {return}
//
//                    let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                    guard let code = jsonData[Constants.Keys.code] as? String,  code == Constants.Keys.success else {completion(.Error(msg));return}
//
//                    let classResponse = ModelClassResponse.init(json: jsonData)
//
//                    completion(.Success(classResponse))
//
//                case .failure(let error):
//                    completion(.Error(error.localizedDescription))
//
//            }
//        }
//    }
    
//    //MARK: API-3 - GET - WARD LIST API
//    func wardListAPI(parent_id: String, completion: @escaping ResultCompBlk) {
//
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.getWardList)
//        let jsonBody = "{\"\(Constants.Keys.parent_id)\":\"\(parent_id)\"}"
//        let request = makePostRequestWithHeader(url: urlLink, jsonBody: jsonBody)
//
//        Alamofire.request(request).validate().responseJSON { (response) in
//            guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
//                completion(.Error("Something went wrong!!.Please try again."))
//                return
//            }
//
//            switch response.result {
//            case .success(let data):
//
//                guard let jsonData = data as? JSON else {//Logger.print("jsonData😩");
//                    return}
//               // Logger.print("jsonData = \(jsonData)😄")
//
//                let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                guard let code = jsonData[Constants.Keys.code] as? String,  code == Constants.Keys.success else {completion(.Error(msg));return}
//
//                let classResponse = ModelClassResponse(json: jsonData)
//                completion(.Success(classResponse))
//
//
//            case .failure(let error):
//
//                completion(.Error(error.localizedDescription))
//            }
//        }
//    }
    
    
}
