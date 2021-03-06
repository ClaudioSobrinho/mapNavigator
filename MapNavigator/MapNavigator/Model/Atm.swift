//
//  Atm.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation
import CoreLocation

struct Atm: Codable {
    let address: Address?
    let openingHours: OpeningHours?
    let ratings: Ratings?
    let category: String?
    let categoryText: String?
    let imagePath: String?
    let latitude: String?
    let longitude: String?
    let name: String?
    let sonectId: String?
    let tagline: String?
    
    var location: CLLocation? {
        guard let latitude = self.latitude, let longitude = self.longitude else {
            return nil
        }
        return CLLocation(latitude: CLLocationDegrees(latitude.doubleValue), longitude: CLLocationDegrees(longitude.doubleValue))
    }
    
    //Mark: Functions
    func distance(to location: CLLocation) -> CLLocationDistance {
        guard let atmLocation = self.location else {
            return 0
        }
        return atmLocation.distance(from: location)
    }
}
