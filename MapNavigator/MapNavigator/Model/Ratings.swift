//
//  Ratings.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/29/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

struct Ratings: Codable {
    let overall: Overall?
    let all: [Rating]?
}

struct Overall: Codable {
    let one: Int?
    let two: Int?
    let tree: Int?
    let four: Int?
    let five: Int?
    
    enum CodingKeys : String, CodingKey {
        case one = "1"
        case two = "2"
        case tree = "3"
        case four = "4"
        case five = "5"
    }
}

struct Rating: Codable {
    let rating: Int?
    let comment: String?
    let by: String?
    let date: String?
}
