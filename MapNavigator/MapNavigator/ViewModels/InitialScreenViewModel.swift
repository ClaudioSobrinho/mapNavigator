//
//  InitialScreenViewModel.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/29/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation
import CoreLocation

class InitialScreenViewModel {
    
    // MARK: - Private Vars
    private var atmList = [Atm]()
    private var lastLocation = CLLocation()
    
    // MARK: Functions
    func getATMsList(completion: @escaping ([Atm]) -> Void) {
        Services.shared.getATMsData(completion: {list in
            self.atmList = list
            completion(self.atmList)
        })
    }
    
    func sortATMsListByDistance(to myLocation: CLLocation) {
        lastLocation = myLocation
        atmList.sort(by: { $0.distance(to: myLocation).rounded() < $1.distance(to: myLocation).rounded() })
    }
    
    func numberOfItems() -> Int {
        return atmList.count
    }
    
    func cellViewModel(for index: Int) -> AtmListCellViewModel{
        let atm = atmList[index]
        
        let vm = AtmListCellViewModel(cellColor: nil, atmImage: nil, topLabelText: atm.name, bottomLabelText: atm.tagline, rightLabelText: "\(String(describing: atm.location!.distance(from: lastLocation).rounded()))m")
        
        return vm
    }
}
