

import Foundation

enum LocationError: Error {
    case failedToGetLocation
    
    var errorDescription: String? {
        switch self {
        case .failedToGetLocation:
            return "Couldn't get current location"
        }
    }
}
