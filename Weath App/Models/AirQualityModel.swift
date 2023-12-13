
import Foundation

// MARK: - AirQualityModel
struct AirQualityModel: Codable {
    let list: [AQIReading]
}

// MARK: - AQIReading
struct AQIReading: Codable {
    let main: Main
    let components: [String: Double]
    let dt: Int
}
