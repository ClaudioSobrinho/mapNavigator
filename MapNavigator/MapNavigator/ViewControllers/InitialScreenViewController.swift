//
//  InitialScreenViewController.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit
import GoogleMaps

class InitialScreenViewController: UIViewController {
    
    //    MARK: Properties
    private let viewModel = InitialScreenViewModel()
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 47.362962, longitude: 8.549960, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.icon = UIImage(named: "iconUserLocation")
        marker.position = CLLocationCoordinate2D(latitude: 47.362962, longitude: 8.549960)
        marker.title = "User"
        marker.snippet = "My Location"
        marker.map = mapView
        
        plotAtms(to: mapView)
    }
    
    private func plotAtms(to map: GMSMapView) {
        viewModel.getATMsList(completion: {atmList in
            for atm in atmList {
                DispatchQueue.main.async {
                    self.makeMarker(for: atm).map = map
                }
            }
        })
    }
    
    private func makeMarker(for atm: Atm) -> GMSMarker {
        guard let latitude = atm.latitude, let longitude = atm.longitude else { return GMSMarker()}
        let marker = GMSMarker()
        marker.icon = UIImage(named: "iconLocationMarker")
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude.doubleValue), longitude: CLLocationDegrees(longitude.doubleValue))
        marker.title = atm.name
        marker.snippet = atm.tagline
        
        return marker
    }
}
