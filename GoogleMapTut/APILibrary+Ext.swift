//
//  APILibrary+Ext.swift
//  Loqqat
//
//  Created by Qaptive Technologies on 25/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import Alamofire

extension APILibrary {
    
//    //MARK: API-4 - GET - OTP API
//    func verifyParentOTP(device_info: String, mobile: String, otp: String, completion: @escaping ResultCompBlk) {
//        
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.verifyParentOtp)
//        Logger.pnt("urlLink = \(urlLink)")
//        
//        let jsonBody = "{\"\(Constants.Keys.device_info)\":\"\(device_info)\",\"\(Constants.Keys.mobile)\":\"\(mobile)\", \"\(Constants.Keys.otp)\":\"\(otp)\"}"
//        
//        Logger.pnt(jsonBody)
//        
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
//                guard let jsonData = data as? JSON else {Logger.pnt("jsonData😩");return}
//                Logger.pnt("jsonData = \(jsonData)😄")
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
    
//    //MARK: API-5 - POST - GET TIME LINE API
//    func getTimeLineAPI(student_id: String, completion: @escaping ResultCompBlk) {
//
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.getTimeline)
//        Logger.pnt("urlLink = \(urlLink)")
//
//
//        let jsonBody = "{\"\(Constants.Keys.student_id)\":\"\(student_id)\"}"
//
//        Logger.pnt("jsonBody = \(jsonBody)")
//
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
//                guard let jsonData = data as? JSON else {Logger.pnt("jsonData😩");return}
//                Logger.pnt("jsonData = \(jsonData)😄")
//
//                let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                guard let code = jsonData[Constants.Keys.code] as? String, code == Constants.Keys.success else {completion(.Error(msg));return}
//
//                let classResponse = ModelClassResponse(json: jsonData)
//                completion(.Success(classResponse))
//
//            case .failure(let error):
//                completion(.Error(error.localizedDescription))
//            }
//        }
//    }
    
//    //MARK: API-6 - POST - GET Contact Detail API
//    func getContactDetails(student_id: String, completion: @escaping ResultCompBlk) {
//
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.getContactDetails)
//        Logger.pnt("urlLink = \(urlLink)")
//
//        let jsonBody = "{\"\(Constants.Keys.student_id)\":\"\(student_id)\"}"
//        Logger.pnt("jsonBody = \(student_id)")
//
//        let request = makePostRequestWithHeader(url: urlLink, jsonBody: jsonBody)
//
//        Alamofire.request(request).validate().responseJSON { (response) in
//
//            guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
//                completion(.Error("Something went wrong!!.Please try again."))
//                return
//            }
//
//            switch response.result {
//            case .success(let data):
//
//                guard let jsonData = data as? JSON else {Logger.pnt("jsonData😩");return}
//                Logger.pnt("jsonData = \(jsonData)😄")
//
//                let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                guard let code = jsonData[Constants.Keys.code] as? String, code == Constants.Keys.success else {completion(.Error(msg));return}
//
//                let classResponse = ModelClassResponse(json: jsonData)
//                completion(.Success(classResponse))
//
//            case .failure(let error):
//                completion(.Error(error.localizedDescription))
//            }
//        }
//    }
    
    
}
