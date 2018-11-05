//
//  Localizable.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 29/10/2018.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

struct Localizable {
    
    struct AtmListVC {
        static let title = "title".localized
        
    }
}

extension String {
        var localized: String {
            return NSLocalizedString(self, tableName: "Localizable", comment: "")
        }
}
