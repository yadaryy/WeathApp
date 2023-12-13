

import SwiftUI

class WeatherViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties

    private let locationManager = LocationManager()
    
    @Published var weatherModel: WeatherModel?
    @Published var forecastModel: ForecastModel?
    @Published var errorMessage: String?
    
    override init() {
        super.init()
        fetchWeatherAndForecastDataByLocation()
    }
    
    // MARK: - Computed Properties
    
    var cityName: String {
        return self.weatherModel?.name ?? ""
    }
    
    var temp: String {
            return (self.weatherModel?.main.temp).map { "\(Int($0))°C" } ?? "N/A"
        }
    
    var feelsLike: String {
        return (self.weatherModel?.main.feelsLike).map { "\(Int($0))°C" } ?? "N/A"
    }
    
    var descript: String {
        return self.weatherModel?.weather.first?.description.capitalized ?? ""
    }
    
    var windSpeed: String {
        return (self.weatherModel?.wind.speed).map { "\(Int($0))km/h" } ?? "N/A"
    }
    
    var humidity: String {
        return (self.weatherModel?.main.humidity).map { "\(Int($0))%" } ?? "N/A"
    }
    
    var sunriseTime: String {
        return (self.weatherModel?.sys.sunrise).map { Date.fromUnixTimestamp($0).formatTime() } ?? "N/A"
    }
    
    var sunsetTime: String {
        return (self.weatherModel?.sys.sunset).map { Date.fromUnixTimestamp($0).formatTime() } ?? "N/A"
    }
    
    var pressure: String {
        return (self.weatherModel?.main.pressure).map { "\((Int(Double($0)) / 100)) mb" } ?? "N/A"
    }
    
    var visibility: String {
        return (self.weatherModel?.visibility).map { "\((Double($0) / 1000)) km" } ?? "N/A"
    }
    
    var date: String {
        return (self.weatherModel?.dt).map { Date.fromUnixTimestamp($0).formatFullDate() } ?? ""
    }
    
    var weatherIcon: Image {
        return convertWeatherIconFromId(weatherModel?.weather.first?.icon ?? "")
    }
}

extension WeatherViewModel {
    
    // MARK: - Methods
    // Fetches the weather and forecast data based on the user's current location
    func fetchWeatherAndForecastDataByLocation() {
        guard let latitude = locationManager.userLocation?.coordinate.latitude.rounded(toPlaces: 2),
              let longitude = locationManager.userLocation?.coordinate.longitude.rounded(toPlaces: 2) else {
            self.errorMessage = "[Location] Location not determined"
            return
        }
        
        guard let currentWeatherURL = URL(string: API.getCurrentWeather(latitude, longitude)) else {
            self.errorMessage = "[Weather] Invalid URL"
            return
        }
        
        guard let forecastWeatherURL = URL(string: API.getForecastWeather(latitude, longitude)) else {
            self.errorMessage = "[Forecast] Invalid URL"
            return
        }
        
        // Use NetworkManager to fetch data from the URL
        NetworkManager.fetch(for: currentWeatherURL, for: forecastWeatherURL) { (result: Result<(WeatherModel, ForecastModel), HTTPError>) in
            switch result {
            case .success(let (response1, response2)):
                DispatchQueue.main.async {
                    self.weatherModel = response1
                    self.forecastModel = response2
                }
            case .failure(let error):
                self.errorMessage = "\(error.errorDescription)"
            }
        }
    }
    
    
    func fetchWeatherAndForecastDataBySearch(_ query: String) {
        guard let currentWeatherURL = URL(string: API.getCurrentWeatherBySearch(query)) else {
            self.errorMessage = "[Weather] Invalid URL"
            return
        }
        
        guard let forecastWeatherURL = URL(string: API.getForecastWeatherBySearch(query)) else {
            self.errorMessage = "[Forecast] Invalid URL"
            return
        }
        
        NetworkManager.fetch(for: currentWeatherURL, for: forecastWeatherURL) { (result: Result<(WeatherModel, ForecastModel), HTTPError>) in
            switch result {
            case .success(let (response1, response2)):
                DispatchQueue.main.async {
                    self.weatherModel = response1
                    self.forecastModel = response2
                }
            case .failure(let error):
                self.errorMessage = "\(error.errorDescription)"
            }
        }
    }
}
