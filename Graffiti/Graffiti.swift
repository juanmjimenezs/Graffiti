//
//  Graffiti.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 2/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit
import MapKit

class Graffiti: NSObject {
    let address: String
    let latitude: Double
    let longitude: Double
    let imageUrl: String
    
    init(address: String, latitude: Double, longitude: Double, imageUrl: String) {
        self.address = address
        self.longitude = longitude
        self.latitude = latitude
        self.imageUrl = imageUrl
    }
}

extension Graffiti: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        }
    }
    
    var title: String? {
        get {
            return "Graffiti"
        }
    }
    
    var subtitle: String? {
        get {
            return self.address.replacingOccurrences(of: "\n", with: "")
        }
    }
}
