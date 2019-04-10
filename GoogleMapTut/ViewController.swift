//
//  ViewController.swift
//  GoogleMapTut
//
//  Created by Qaptive Technologies on 08/04/19.
//  Copyright © 2019 Qaptive Technologies. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var pinCenter: NSLayoutConstraint!
    
    
    var funcs = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funcs.setLocMamager(self)
        funcs.delegate = self
        funcs.loc_API_timer(isPaused: false, self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        funcs.set_markers_on_map(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        funcs.loc_API_timer(isPaused: true, self)
    }


}

