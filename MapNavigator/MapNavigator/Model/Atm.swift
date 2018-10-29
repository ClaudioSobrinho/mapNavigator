//
//  Atm.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

class Atm: Codable {
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
}
