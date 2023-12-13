

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject var weatherVM = WeatherViewModel()
    @StateObject var airVM = AirQualityViewModel()
    @State var searchText : String = ""
    @State var showLocationSearchView : Bool = false
    @State var isRefreshing: Bool = false
    
    
    var body: some View {
        VStack {
            SearchBarView(viewModel: weatherVM, searchText: $searchText, showLocationSearhView: $showLocationSearchView).onTapGesture {
                showLocationSearchView = true
                
            }
            if !showLocationSearchView {
                TabView{
                    RefreshableScrollView(isRefreshing: $isRefreshing) {
                        weatherVM.fetchWeatherAndForecastDataByLocation()
                        isRefreshing = false
                    } content: {
                        VStack{
                            CardView(viewModel: weatherVM)
                            WeatherView(viewModel: weatherVM)
                            TemperatureView(viewModel: weatherVM)
                        }
                    }
                    
                    RefreshableScrollView(isRefreshing: $isRefreshing) {
                        airVM.fetchAirQualityDataByLocation()
                        isRefreshing = false
                    } content: {
                        VStack{
                            AQIView(airViewModel: airVM,viewModel: weatherVM)
                            AQIAverageView()
                        }
                    }
                    
                } .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            } else {
                ScrollView(showsIndicators: false) {
                    LocationSearchView(viewModel: weatherVM, showLocationSearchView:$showLocationSearchView, searchText: $searchText)
                }
            }
        }.onAppear{
            isRefreshing = true
            weatherVM.fetchWeatherAndForecastDataBySearch("Bangkok")
            isRefreshing = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

