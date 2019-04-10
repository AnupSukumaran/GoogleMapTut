//
//  ViewController+Ext.swift
//  GoogleMapTut
//
//  Created by Qaptive Technologies on 08/04/19.
//  Copyright © 2019 Qaptive Technologies. All rights reserved.
//

import GoogleMaps

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //funcs.didChangeAuthorization(self,status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if funcs.map_had_the_first_update {
            
            let tempUser: UserDefaults = UserDefaults.standard
            
            // tempUser.set(mapView.camera, forKey: "Camera")
            tempUser.set(mapView.camera.target.longitude, forKey: "lastLongitude")
            tempUser.set(mapView.camera.target.latitude, forKey: "lastLatitude")
            tempUser.set(mapView.camera.zoom, forKey: "lastZoom")
            tempUser.set(mapView.camera.bearing, forKey: "lastBearing")
            tempUser.set(mapView.camera.viewingAngle, forKey: "lastViewingAngle")
        }
        
        funcs.didUpdateLocations(self, locations)
    }
}


extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        if funcs.map_had_the_first_update {
            
            let tempUser: UserDefaults = UserDefaults.standard
            
            // tempUser.set(mapView.camera, forKey: "Camera")
            tempUser.set(mapView.camera.target.longitude, forKey: "lastLongitude")
            tempUser.set(mapView.camera.target.latitude, forKey: "lastLatitude")
            tempUser.set(mapView.camera.zoom, forKey: "lastZoom")
            tempUser.set(mapView.camera.bearing, forKey: "lastBearing")
            tempUser.set(mapView.camera.viewingAngle, forKey: "lastViewingAngle")
        }
        
        funcs.reverseGeocodeCoordinate(position.target, self)
    }
}

extension ViewController: MapViewModelDelegate {
    
    func timerAction() {
//        guard let studentDetail = funcs.selectedStudent else {Logger.pnt("StudentDetail😓");return}
//        Logger.pnt("stud_id = \(studentDetail.student_id ?? "0")")
//
      //  funcs.refresh_mapview_with_API( studentDetail, self)
        funcs.set_markers_on_map(self)
    }
    
}
