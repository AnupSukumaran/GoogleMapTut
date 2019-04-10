//
//  LocLibrary.swift
//  Loqqat
//
//  Created by Qaptive Technologies on 29/03/19.
//  Copyright © 2019 Qaptive_Technologies. All rights reserved.
//

import GoogleMaps


class LocLibrary {
    
    //MARK: Convert lat and long to Address
    static func reverseGeocodeCoor(_ lat: String, _ long: String, completion: @escaping(String,String) -> ())  {
        
        let modLat = CLLocationDegrees(lat) ?? 0.0
        let modeLong = CLLocationDegrees(long) ?? 0.0
        let coord = CLLocationCoordinate2D(latitude: modLat, longitude: modeLong)
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coord) { response, error in
            //Logger.pnt("resposne = \(String(describing: response))")
            guard let testAddress = response?.firstResult(), let lines = testAddress.lines, let locality =  testAddress.locality else {return}
            let address = lines.joined(separator: "\n")
            
            completion(address, locality)
            
        }
    }
    
    //MARK:
    static func coordinater_Maker(_ lat: String, _ long: String) -> CLLocationCoordinate2D? {
        guard let modLat = CLLocationDegrees(lat), let modeLong = CLLocationDegrees(long) else {return nil}
        return CLLocationCoordinate2D(latitude: modLat, longitude: modeLong)
    }
    
}
