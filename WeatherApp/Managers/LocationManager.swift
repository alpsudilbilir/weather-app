//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Alpsu Dilbilir on 3.04.2022.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var userLocation: CLLocation?
    @Published var cityName = ""
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestWhenInUseAuthorization()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Not Determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied.")
        case .authorizedAlways:
            print("AuthorizedAlways")
        case .authorizedWhenInUse:
            print("Auth when in use")
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error when getting location")
        isLoading = false
    }
    func updateCityName(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude:  longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { [self] (placemarks, _) -> Void in
            placemarks?.forEach { (placemark) in
                if let city = placemark.locality {
                    self.cityName = city
                }
            }
        })
    }
}
