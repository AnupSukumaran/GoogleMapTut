//
//  APILibrary+Ext2.swift
//  Loqqat
//
//  Created by Qaptive Technologies on 08/04/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import Alamofire

extension APILibrary {
    
//    //MARK: API-8 - POST - For Push Notification
//    func updateParentDeviceInfo_API(device_token: String, type: String, completion: @escaping ResultStringCompBlk) {
//        
//        let urlLink = URLFormater.shared.returnUrl([:], withPathExtension: Constants.PathExt.updateParentDeviceInfo)
//        Logger.pnt("urlLink = \(urlLink)")
//        
//        let jsonBody = "{\"\(Constants.Keys.device_token)\":\"\(device_token)\",\"\(Constants.Keys.type)\":\"\(type)\"}"
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
    
}

