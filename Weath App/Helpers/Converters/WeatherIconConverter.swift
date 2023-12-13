
import SwiftUI

func convertWeatherIconFromId(_ id: String) -> Image {
    switch id {
    case "00":
        return Image(systemName: "questionmark")
    case "01d":
        return Image("sun")
    case "01n":
        return Image("moon")
    case "02d":
        return Image("sun cloud")
    case "02n":
        return Image("moon cloud")
    case "03d", "03n", "04d", "04n":
        return Image("cloud")
    case "09d", "09n", "10d", "10n":
        return Image("cloud sun rain")
    case "11d", "11n":
        return Image("cloud bolt")
    case "13d", "13n":
        return Image("cloud snow")
    case "50d", "50n":
        return Image("Wind")
    default:
        return Image(systemName: "")
    }
}
