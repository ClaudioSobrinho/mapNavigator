//
//  InitialScreenViewController.swift
//  MapNavigator
//
//  Created by Claudio Sobrinho on 10/28/18.
//  Copyright © 2018 Claudio Sobrinho. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class InitialScreenViewController: UIViewController {
    
    //    MARK: Properties
    private let viewModel = InitialScreenViewModel()
    private let locationManager = CLLocationManager()
    private let defaultLocation = CLLocation(latitude: 47.362962, longitude: 8.549960)
    
    // MARK: LifeCycle
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 47.362962, longitude: 8.549960, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.icon = UIImage(named: "iconUserLocation")
        marker.position = CLLocationCoordinate2D(latitude: 47.362962, longitude: 8.549960)
        marker.title = "User"
        marker.snippet = "Fake Location"
        marker.map = mapView
        
        plotAtms(to: mapView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLocationManager()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addListButton()
    }
    
    // MARK: Configs
    func configLocationManager() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: Actions
    @objc func didTouchListButton() {
        goToAtmList()
    }
    
    private func goToAtmList(){
        let navigationController = UINavigationController(rootViewController: AtmListViewController(viewModel: viewModel))
        present(navigationController, animated: true, completion: nil)
    }
    
    
    // MARK: Appearence
    private func addListButton() {
        let listButton = UIButton()
        listButton.frame.size = CGSize(width: 50, height: 50)
        listButton.center = CGPoint(x: view.center.x, y: view.height - 100)
        listButton.setImage(UIImage(named: "iconListButton"), for: .normal)
        
        listButton.addTarget(self, action: #selector(didTouchListButton), for: .touchUpInside)
        
        view.addSubview(listButton)
    }
    
    // MARK: Functions
    private func plotAtms(to map: GMSMapView) {
        viewModel.getATMsList(completion: {atmList in
            for atm in atmList {
                DispatchQueue.main.async {
                    self.makeMarker(for: atm, with: atm.distance(to: self.defaultLocation).rounded()).map = map
                }
            }
        })
    }
    
    private func makeMarker(for atm: Atm, with distance: Double) -> GMSMarker {
        guard let latitude = atm.latitude, let longitude = atm.longitude else { return GMSMarker()}
        let marker = GMSMarker()
        marker.icon = UIImage(named: "iconLocationMarker")
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude.doubleValue), longitude: CLLocationDegrees(longitude.doubleValue))
        marker.title = atm.name
        marker.snippet = "Distance: \(distance)m"
        
        return marker
    }
}

// MARK: CLLocationManagerDelegate
extension InitialScreenViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.viewModel.sortATMsListByDistance(to: location)
        self.locationManager.stopUpdatingLocation()
    }
}
