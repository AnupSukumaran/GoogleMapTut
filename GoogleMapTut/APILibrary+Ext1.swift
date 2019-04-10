//
//  APILibrary+Ext1.swift
//  Loqqat
//
//  Created by Sukumar Anup Sukumaran on 30/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

extension APILibrary {
    
//    //MARK: API-7 - POST - updateBoardingPoint
//    func updateBoardingPoint(student_id: String, parent_id: String,pLat: Double,pLong: Double, dLat: Double,dLong: Double, pName: String, dName: String , completion: @escaping ResultStringCompBlk) {
//        
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.updateBoardingPoint)
//        Logger.pnt("urlLink = \(urlLink)")
//        
//        let jsonBody = "{\"\(Constants.Keys.parent_id)\": \"\(parent_id)\",\"\(Constants.Keys.student_id)\" : \"\(student_id)\",\"\(Constants.Keys.boarding_point)\": {\"\(Constants.Keys.latitude)\": \(pLat),\"\(Constants.Keys.longitude)\": \(pLong),\"\(Constants.Keys.name)\": \"\(pName)\"},\"\(Constants.Keys.drop_point)\": {\"\(Constants.Keys.latitude)\": \(dLat),\"\(Constants.Keys.longitude)\": \(dLong),\"\(Constants.Keys.name)\": \"\(dName)\"}}"
//        
//        Logger.pnt(jsonBody)
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
//                completion(.Success(msg))
//                
//            case .failure(let error):
//                completion(.Error(error.localizedDescription))
//            }
//        }
//    }
    
//    //MARK: API-8 - POST - updateBoardingPoint
//    func get_Stud_Current_Loc_API(student_id: String, parent_id: String, completion: @escaping ResultCompBlk) {
//        
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.getStudCurrentLoc)
//        Logger.pnt("urlLink = \(urlLink)")
//        
//        let jsonBody = "{\"\(Constants.Keys.parent_id)\":\"\(parent_id)\",\"\(Constants.Keys.student_id)\":\"\(student_id)\"}"
//        
//        Logger.pnt(jsonBody)
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
//                guard let jsonData = data as? JSON else {Logger.pnt("jsonData😩");return}
//                Logger.pnt("jsonData = \(jsonData)😄")
//                
//                let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                guard let code = jsonData[Constants.Keys.code] as? String, code == Constants.Keys.success else {completion(.Error(msg));return}
//                let classResponse = ModelClassResponse(json: jsonData)
//                completion(.Success(classResponse))
//                
//            case .failure(let error):
//                completion(.Error(error.localizedDescription))
//            }
//        }
//    }
    
//    //MARK: API-9 - POST - Logout
//    func logOutParentAPI( parent_id: String, completion: @escaping ResultStringCompBlk) {
//
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.logOutParent)
//        Logger.pnt("urlLink = \(urlLink)")
//
//        let jsonBody = "{\"\(Constants.Keys.parent_id)\":\"\(parent_id)\"}"
//
//        Logger.pnt(jsonBody)
//
//        let request = makePostRequest(url: urlLink, jsonBody: jsonBody)
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
//                guard let jsonData = data as? JSON else {Logger.pnt("jsonData😩");return}
//                Logger.pnt("jsonData = \(jsonData)😄")
//
//                let msg = jsonData[Constants.Keys.message] as? String ?? "-NF-"
//                guard let code = jsonData[Constants.Keys.code] as? String, code == Constants.Keys.success else {completion(.Error(msg));return}
//
//                completion(.Success(msg))
//
//            case .failure(let error):
//                completion(.Error(error.localizedDescription))
//            }
//        }
//    }
    
    
    //MARK: API-10 - Google API Route api
    func drawPath(startLocation: CLLocation, endLocation: CLLocation, completion: @escaping(Results<JSON>) -> ())
    {
        let origin = "\(startLocation.coordinate.latitude),\(startLocation.coordinate.longitude)"
        let destination = "\(endLocation.coordinate.latitude),\(endLocation.coordinate.longitude)"
        
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=AIzaSyCucBX-zzVBw1bDxoJSj0549KwCP2IUa8o"
        
        Alamofire.request(url).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode, statusCode >= 200 && statusCode <= 299 else {
               completion(.Error("Something went wrong!!.Please try again."))
                            return
          }
            
            switch response.result {
            case .success(let data):
                
                guard let jsonData = data as? JSON else {Logger.pnt("jsonData😩");
                    return}
                
                completion(.Success(jsonData))
                
            case .failure(let error):
                
                completion(.Error(error.localizedDescription))
            }
        }
        
    }
    
    
}
