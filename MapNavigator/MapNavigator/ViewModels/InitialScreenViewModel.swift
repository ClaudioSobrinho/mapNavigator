//
//  InitialScreenViewModel.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/29/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

class InitialScreenViewModel {
    
    private var atmList = [Atm]()
    
    func getATMsList(completion: @escaping ([Atm]) -> Void) {
        Services.shared.getATMsData(completion: {list in
            self.atmList = list
            completion(self.atmList)
        })
    }
}
