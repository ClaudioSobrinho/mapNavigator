//
//  OpeningHours.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/29/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

struct OpeningHours: Codable {
    let sunday: DayOfWeek?
    let monday: DayOfWeek?
    let tuesday: DayOfWeek?
    let wednesday: DayOfWeek?
    let thursday: DayOfWeek?
    let friday: DayOfWeek?
    let saturday: DayOfWeek?
    let active: Bool?
}

struct DayOfWeek: Codable {
    let open: String?
    let close: String?
}

//enum dayOfWeek: String, Codable {
//    case sunday
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//    case saturday
//}
