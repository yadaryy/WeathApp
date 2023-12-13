
import Firebase

struct FirestoreAQIData: Codable {
    let latitude: Double?
    let longitude: Double?
    let aqi: Int?
    let components: AirQualityData.AirQualityInfo.Components?
    let timestamp: TimeInterval?
}
