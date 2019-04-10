//
//  URLFormater.swift
//  Loqqat
//
//  Created by Sukumar Anup Sukumaran on 20/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import Foundation

class URLFormater {
    
    static let shared = URLFormater()
    private init() {}
    
    // create a URL from parameters
    func returnUrl(_ parameters: JSON, withPathExtension: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.ApiBase.APIScheme
        components.host = Constants.ApiBase.APIHost
        components.path = Constants.ApiBase.APIPath + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
}

