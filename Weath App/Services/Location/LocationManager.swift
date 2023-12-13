

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocation?
    @Published var errorMessage: String?
    @Published var locationObtained: Bool = false

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        startUpdateLocation()
    }

    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func startUpdateLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdateLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    // Delegate method called when new location data is available
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.userLocation = location
            self.errorMessage = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorMessage = error.localizedDescription
    }
}
