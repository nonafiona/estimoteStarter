//
//  ViewController.swift
//  estimoteStarter
//
//  Created by Fiona Carty on 12/16/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D") as! UUID, identifier: "Estimotes")
        // MARK: if the request hasn't been authorized
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeacons(in: region)
        
    }

    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print(beacons)
        // MARK: new array that filters out all the unknown beacons
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
    }

}

