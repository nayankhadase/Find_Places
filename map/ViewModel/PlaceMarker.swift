//
//  PlaceMarker.swift
//  map
//
//  Created by nayan.khadase on 08/12/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class PlaceMarker: GMSMarker {
    // 1
    let place: GMSPlace
    
    // 2
    init(place: GMSPlace, availableTypes: [String]) {
        self.place = place
        super.init()
        
        position = place.coordinate
        groundAnchor = CGPoint(x: 0.5, y: 1)
        appearAnimation = .pop
        
        var foundType = "restaurant"
        let possibleTypes = availableTypes.count > 0 ?
            availableTypes :
            ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
        if let types = place.types{
            for type in types {
                if possibleTypes.contains(type) {
                    foundType = type
                    print("found type: \(foundType)")
                    break
                }
                
            }
            icon = UIImage(named: foundType+"_pin")
        }
        
        
    }
}
