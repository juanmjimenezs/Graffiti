//
//  Graffiti.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 2/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit
import MapKit

class Graffiti: NSObject, NSCoding {
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
    
    // MARK: NSCoding
    
    required convenience init?(coder aDecoder: NSCoder) {
        let address = aDecoder.decodeObject(forKey: "address") as! String
        let latitude = aDecoder.decodeDouble(forKey: "latitude")
        let longitude = aDecoder.decodeDouble(forKey: "longitude")
        let imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as! String
        
        self.init(address: address, latitude: latitude, longitude: longitude, imageUrl: imageUrl)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.longitude, forKey: "longitude")
        aCoder.encode(self.latitude, forKey: "latitude")
        aCoder.encode(self.imageUrl, forKey: "imageUrl")
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
