//
//  Address.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/29/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

struct Address: Codable {
    let city: String?
    let zip: String?
    let toString: String?
    
    private enum CodingKeys: String, CodingKey {
        case city
        case zip
        case toString = "formatted"
    }
}
