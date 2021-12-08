//
//  CurrentLocation.swift
//  map
//
//  Created by nayan.khadase on 02/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit
import CoreLocation

protocol CurrentLocationDelegate: CLLocationManagerDelegate {
    func getCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
}

class CurrentLocation: NSObject {
    var locationCoordinate: CLLocation?
    var locationManager = CLLocationManager()
   
    
    var delegate: CurrentLocationDelegate?
    
}
extension CurrentLocation: CLLocationManagerDelegate{
     //get location access
    
    //                ///     /// work for self  /// find solution
    func setUpLocationService(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            if CLLocationManager.authorizationStatus() == .notDetermined{
                locationManager.requestWhenInUseAuthorization()
            }else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
                locationManager.requestLocation()
            }
        }
    }
    
    
    // get location coordinates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        delegate?.getCurrentLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    
    // errors while getting location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error in getting location: \(error)")
    }
    
}
