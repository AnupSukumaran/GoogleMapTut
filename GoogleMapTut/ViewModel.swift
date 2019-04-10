//
//  ViewModel.swift
//  GoogleMapTut
//
//  Created by Qaptive Technologies on 08/04/19.
//  Copyright © 2019 Qaptive Technologies. All rights reserved.
//

import GoogleMaps

protocol MapViewModelDelegate: class {
    func timerAction()
}


class ViewModel: NSObject {
    let locationManager = CLLocationManager()
    var map_had_the_first_update = false
    var currentPos: PlaceMarker?
    var destinationPos: PlaceMarker?
    var apiReferesherTimer: Timer?
    weak var delegate: MapViewModelDelegate?
    
    //MARK:
    func setLocMamager(_ main: ViewController) {
        
        locationManager.delegate = main
        locationManager.requestWhenInUseAuthorization()
        main.mapView.delegate = main
    }
    
    //MARK:
    func didChangeAuthorization(_ main: ViewController,_ status :CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {return}
        locationManager.startUpdatingLocation()
        main.mapView.isMyLocationEnabled = true
        main.mapView.settings.myLocationButton = true
    }
    
    //MARK:
    func didUpdateLocations(_ main: ViewController,_ locations: [CLLocation]) {
        guard let location = locations.first else {return}
        main.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
    }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D, _ main: ViewController) {
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            
            guard let address = response?.firstResult(), let lines = address.lines else {return}
            main.addressLabel.text = lines.joined(separator: "\n")
            let labelHeight = main.addressLabel.intrinsicContentSize.height
            main.mapView.padding = UIEdgeInsets(top: main.view.safeAreaInsets.top, left: 0,bottom: labelHeight, right: 0)
            
            UIView.animate(withDuration: 0.25) {
                main.pinCenter.constant = ((labelHeight - main.view.safeAreaInsets.top) * 0.5)
                main.view.layoutIfNeeded()
            }
            
        }
    }
    
     var tempBearing: Double = 0.0
     var mainCurrentCll = CLLocation()
        //MARK:
     func set_markers_on_map(_ main: ViewController) {
        
        var currentPoint: CLLocationCoordinate2D?
        var mainDropPoint: CLLocationCoordinate2D?
        var currentCLL: CLLocation?
        var dropCLL: CLLocation?
        
        main.mapView.clear()

        let curlat = "10.024395"
        let curlong = "76.308034"
            
        if let curCord = LocLibrary.coordinater_Maker(curlat, curlong) {
            currentPoint = curCord
        }
    
        let dropLat = "9.969537"
        let dropLong = "76.318305"
           
        if let dropCord = LocLibrary.coordinater_Maker(dropLat, dropLong) {
            mainDropPoint = dropCord
        }
        
        guard let curPnt = currentPoint, let dropPnt = mainDropPoint else {return}
        currentCLL = CLLocation(latitude: curPnt.latitude, longitude: curPnt.longitude)
        dropCLL = CLLocation(latitude: dropPnt.latitude, longitude: dropPnt.longitude)
        
        guard let curntCLL = currentCLL, let drpCLL = dropCLL else {Logger.pnt("CLL😓");return}
        mainCurrentCll = curntCLL

        drawpath(startLocation: curntCLL, endLocation: drpCLL, main)
        
        tempBearing = getBearingBetweenTwoPoints1(point1: curntCLL, point2: drpCLL)
        
        
        currentPos = set_Img_for_individual_markers(curPnt, main, true, markerImg: #imageLiteral(resourceName: "busMarker"), bearing: tempBearing)
        destinationPos = set_Img_for_individual_markers(dropPnt, main, false, markerImg: #imageLiteral(resourceName: "schoolMarker"), bearing: nil)
        
       
    }
    
    
    var markers = [GMSMarker]()
    //MARK:
    func set_Img_for_individual_markers(_ coordinates: CLLocationCoordinate2D, _ main: ViewController,_ set_as_center_marker: Bool, markerImg: UIImage, bearing : Double? ) -> PlaceMarker?{
        
        let marker = PlaceMarker(location: coordinates, markerImg: markerImg, tempBearing: bearing)
        marker.map = main.mapView
        markers.append(marker)
        
        var bounds = GMSCoordinateBounds()
        let tempUser: UserDefaults = UserDefaults.standard
        
        if map_had_the_first_update &&  markers.count > 2 {
            
            let longitude = tempUser.double(forKey: "lastLongitude")
            let latitude = tempUser.double(forKey: "lastLatitude")
            let zoom = tempUser.float(forKey: "lastZoom")
            let bearing = tempUser.double(forKey: "lastBearing")
            let viewingAngle = tempUser.double(forKey: "lastViewingAngle")
            
            let camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), zoom: zoom, bearing: bearing, viewingAngle: viewingAngle)
            
            main.mapView.camera = camera
            
        } else {
            
            map_had_the_first_update  = true
            let _ = markers.map{ bounds = bounds.includingCoordinate($0.position)}
            let camera = main.mapView.camera(for: bounds, insets: UIEdgeInsets(top: 80 , left: 80, bottom: 80, right: 80))!
            
            let mapView = main.mapView!
            mapView.camera = camera
            
            tempUser.set(mapView.camera.target.longitude, forKey: "lastLongitude")
            tempUser.set(mapView.camera.target.latitude, forKey: "lastLatitude")
            tempUser.set(mapView.camera.zoom, forKey: "lastZoom")
            tempUser.set(mapView.camera.bearing, forKey: "lastBearing")
            tempUser.set(mapView.camera.viewingAngle, forKey: "lastViewingAngle")
            
            
        }
        
        return marker
        
    }
    
    //MARK:
    func drawpath(startLocation: CLLocation, endLocation: CLLocation,_ main: ViewController) {
        
        APILibrary.shared.drawPath(startLocation: startLocation, endLocation: endLocation) { (response) in
            switch response {
            case .Success(let json):
                
                guard let routes = json["routes"] as? [JSON] else {return}
                Logger.pnt("routes = \(routes)😁")
                // print route using Polyline
                for route in routes
                {
                    guard let routeOverviewPolyline = route["overview_polyline"] as? JSON else {Logger.pnt("routeOverviewPolyline😓");return}
                    
                    guard let points = routeOverviewPolyline["points"] as? String else {Logger.pnt("points😓");return}
                    
                    let path = GMSPath.init(fromEncodedPath: points)
                    let polyline = GMSPolyline.init(path: path)
                    polyline.strokeWidth = 4
                    polyline.strokeColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
//                    let data1 = polyline.path?.coordinate(at: 0)
//                    let data2 = polyline.path?.coordinate(at: 1)
//                    let data3 = polyline.path?.coordinate(at: 2)
//                    Logger.pnt("datas = \(data1), \(data2), \(data3)")
//                    let dataCord = polyline.path?.count()
//                    Logger.pnt("dataCord = \(String(describing: dataCord))")
                    
//                    let tempCurrentCLL = CLLocation(latitude: data1!.latitude, longitude: data1!.longitude)
//                    self.tempBearing = self.getBearingBetweenTwoPoints1(point1: self.mainCurrentCll, point2: tempCurrentCLL)
//                    Logger.pnt("tempBearing = \(self.tempBearing)")
//
//                    self.currentPos = self.set_Img_for_individual_markers(startLocation.coordinate, main, true, markerImg: #imageLiteral(resourceName: "busMarker"), bearing: self.tempBearing)
                    
                    
                    polyline.map = main.mapView
                }
                
            case .Error(let error):
                
                Logger.pnt("RouteAPi Error = \(error)")
            }
        }
    }
    
    // UpdteLocationCoordinate
    func updateLocationCoordinates(_ coordinates:CLLocationCoordinate2D, _ main: ViewController) {
        
        if currentPos != nil {
            CATransaction.begin()
            CATransaction.setAnimationDuration(1.0)
            let point: CGPoint = main.mapView.projection.point(for: coordinates)
            let camera: GMSCameraUpdate = GMSCameraUpdate.setTarget(main.mapView.projection.coordinate(for: point))
            main.mapView.animate(with: camera)
            currentPos!.position =  coordinates
            CATransaction.commit()
        }
        
        
    }
    
    func loc_API_timer(isPaused: Bool,_ main: ViewController) {
        
        switch isPaused {
        case true:
            guard let timer = apiReferesherTimer else {Logger.pnt("TimerNill😓");return}
            timer.invalidate()
            
        case false:
            apiReferesherTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(callingHomeApiToRefreshWithTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func callingHomeApiToRefreshWithTimer() {
        
        Logger.pnt("callingFuncWithTimer")
        delegate?.timerAction()
        
    }
    
    func degreesToRadians(degrees: Double) -> Double {
        return degrees * .pi / 180.0
    }
    
    func radiansToDegrees(radians: Double) -> Double {
        return radians * 180.0 / .pi
    }
    
    func getBearingBetweenTwoPoints1(point1 : CLLocation, point2 : CLLocation) -> Double {
        
        let lat1 = degreesToRadians(degrees: point1.coordinate.latitude)
        let lon1 = degreesToRadians(degrees: point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(degrees: point2.coordinate.latitude)
        let lon2 = degreesToRadians(degrees: point2.coordinate.longitude)
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)
        
        return radiansToDegrees(radians: radiansBearing)
    }
}



