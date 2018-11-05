//
//  Services.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import Foundation

class Services {
    
    static let shared = Services()
    private static let baseURL = "http://207.154.210.145:8080/"
    private static let atmURL = "data/ATM_20181005_DEV.json"

    func getATMsData(completion: @escaping ([Atm]) -> Void){
        guard let url = URL(string: "\(Services.baseURL)\(Services.atmURL)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let urlData = try decoder.decode([Atm].self, from: data)
                completion(urlData)
//                print(urlData[0].name)
                
            } catch let err {
                print("⛔️", err)
            }
            }.resume()
    }
}
