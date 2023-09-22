//
//  AirQualityViewModel.swift
//  Weath App
//
//  Created by Setthasit Poosawat on 21/3/23.
//

import SwiftUI

class AirQualityViewModel: NSObject, ObservableObject {
    private let locationManager = LocationManager()

    @Published var airQualityModel: AirQualityModel?
    @Published var aqiViewModel = AQIDataManager()
    @Published var errorMessage: String?

    override init() {
        super.init()
        fetchAirQualityDataByLocation()
    }

    // MARK: - Computed properties
 
    var co: String {
        guard let components = airQualityModel?.list.first?.components,
              let coValue = components["co"] else {
            return "N/A"
        }
        return String(format: "%.2f ppm", coValue)
    }
    
    var no: String {
        guard let components = airQualityModel?.list.first?.components,
              let noValue = components["no"] else {
            return "N/A"
        }
        return String(format: "%.2f ppb", noValue)
    }
    
    var no2: String {
        guard let components = airQualityModel?.list.first?.components,
              let no2Value = components["no2"] else {
            return "N/A"
        }
        return String(format: "%.2f ppb", no2Value)
    }

    var pm25: String {
        guard let components = airQualityModel?.list.first?.components,
              let pm25Value = components["pm2_5"] else {
            return "N/A"
        }
        return String(format: "%.2f µg/m³", pm25Value)
    }

    var airQualityIndex: String {
        if let aqi = airQualityModel?.list.first?.main.aqi {
            return "\(Int(aqi))"
        }
        return "0"
    }
}


extension AirQualityViewModel {
    
    // MARK: - Functions for getting the air quality data
    
    func fetchAirQualityDataByLocation() {
        guard let latitude = locationManager.userLocation?.coordinate.latitude.rounded(toPlaces: 2),
              let longitude = locationManager.userLocation?.coordinate.longitude.rounded(toPlaces: 2) else {
            self.errorMessage = "[Location] Location not determined"
            return
        }
        
        guard let airQualityURL = URL(string: API.getAirQuality(latitude, longitude)) else {
            self.errorMessage = "[Weather] Invalid URL"
            return
        }
        
        NetworkManager.fetch(for: airQualityURL, for: airQualityURL) { (result: Result<(AirQualityModel, AirQualityData), HTTPError>) in
            switch result {
            case .success(let (response1, response2)):
                DispatchQueue.main.async {
                    self.airQualityModel = response1
                    self.aqiViewModel.storeAQIDataInFirestore(response2)
                }
            case .failure(let error):
                self.errorMessage = error.errorDescription
            }
        }
    }
    
    // This function returns the status of Air Quality based on AQI value
    func formatAirQualityStatus() -> String {
        guard let aqi = airQualityModel?.list.first?.main.aqi else { return "N/A" }
        
        switch aqi {
        case 0...50 :
            return "Good"
        case 51...100:
            return "Moderate"
        case 101...150:
            return "Unhealthy for Sensitive Groups"
        case 151...200:
            return "Unhealthy"
        case 201...300:
            return "Very Unhealthy"
        case 301... :
            return "Hazardous"
        default:
            return "N/A"
        }
    }
}
