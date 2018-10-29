//
//  String+MapNavigator.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/29/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

extension String {
    
    var doubleValue: Double {
        
        let nf = NumberFormatter()
        nf.decimalSeparator = "."
        
        if let result = nf.number(from: self) {
            return result.doubleValue
        } else {
            nf.decimalSeparator = ","
            if let result = nf.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}
