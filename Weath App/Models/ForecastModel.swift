

import Foundation

// MARK: - ForecastModel
struct ForecastModel: Codable {
    let list: [ForeList]
    let city: City
}
