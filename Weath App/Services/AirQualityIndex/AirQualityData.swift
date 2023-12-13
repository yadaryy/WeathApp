

import Foundation

struct AirQualityData: Codable {
    let coord: Coordinate
    let list: [AirQualityInfo]
    
    struct Coordinate: Codable {
        let lat: Double
        let lon: Double
    }
    
    struct AirQualityInfo: Codable {
        let main: MainInfo
        let components: Components
        let dt: TimeInterval
        
        struct MainInfo: Codable {
            let aqi: Int
        }
        
        struct Components: Codable {
            let co: Double
            let no: Double
            let no2: Double
            let o3: Double
            let so2: Double
            let pm2_5: Double
            let pm10: Double
            let nh3: Double
        }
    }
}
