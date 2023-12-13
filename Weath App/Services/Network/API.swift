

import Foundation

struct API {  
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static func getCurrentWeather(_ lat: Double, _ lon: Double) -> String {
        return "\(baseURL)weather?lat=\(lat)&lon=\(lon)&appid=\(Secrets.apiKey)&units=metric"
    }
    
    static func getCurrentWeatherBySearch(_ name: String) -> String {
        return "\(baseURL)weather?q=\(name)&appid=\(Secrets.apiKey)&units=metric"
    }
    
    static func getForecastWeather(_ lat: Double, _ lon: Double) -> String {
        return "\(baseURL)forecast?lat=\(lat)&lon=\(lon)&appid=\(Secrets.apiKey)&units=metric"
    }
    
    static func getForecastWeatherBySearch(_ name: String) -> String {
        return "\(baseURL)forecast?q=\(name)&appid=\(Secrets.apiKey)&units=metric"
    }
    
    static func getAirQuality(_ lat: Double, _ lon: Double) -> String {
        return "\(baseURL)air_pollution?lat=\(lat)&lon=\(lon)&appid=\(Secrets.apiKey)"
    }
    
}
