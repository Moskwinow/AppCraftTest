//
//  LocationPresenter.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 17.01.2021.
//

import CoreLocation

protocol LocationManagerOutput: class {
    func newAddress(_ name: String)
}

class LocationPresenter: NSObject {
    var locationManager: CLLocationManager!
    var locationOutput: LocationManagerOutput?
    
    init(coreLocation: CLLocationManager, output: LocationManagerOutput) {
        self.locationManager = coreLocation
        self.locationOutput = output
    }
    
    func startUpdate() {
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }
    
    func stopUpdate() {
        self.locationManager.stopUpdatingLocation()
    }
}

extension LocationPresenter: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let geocoder = CLGeocoder()
        guard let location = locations.first else {return}
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) {[weak self] (marks, error) in
            guard let place = marks?.first else {return}
            let address = "\(place.name!), \(place.country!)"
            self?.locationOutput?.newAddress(address)
        }
    }
}


