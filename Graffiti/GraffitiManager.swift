//
//  GraffitiManager.swift
//  Graffiti
//
//  Created by Juan Manuel Jimenez Sanchez on 4/02/17.
//  Copyright © 2017 Juan Manuel Jimenez Sanchez. All rights reserved.
//

import Foundation

class GraffitiManager {
    static let sharedInstance = GraffitiManager()
    
    var graffitis: [Graffiti] = [Graffiti]()
    
    func save() {
        if let url = databaseUrl() {
            NSKeyedArchiver.archiveRootObject(self.graffitis, toFile: url.path)
        } else {
            print("Error guardando datos")
        }
    }
    
    func load() {
        if let url = databaseUrl(), let saveData = NSKeyedUnarchiver.unarchiveObject(withFile: url.path) as? [Graffiti] {
            self.graffitis = saveData
        } else {
            print("Error cargando los datos")
        }
    }
    
    func databaseUrl() -> URL? {
        if let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let url = URL(fileURLWithPath: documentDirectory)
            return url.appendingPathComponent("graffitis.data")
        } else {
            return nil
        }
    }
    
    func imagesURL() -> URL? {
        if let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let url = URL(fileURLWithPath: documentDirectory)
            return url
        } else {
            return nil
        }
    }
}
