//
//  Graffiti.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 2/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import UIKit

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
