//
//  TemperatureView.swift
//  Weath App
//
//  Created by Yadar Tulayathamrong on 2/3/2566 BE.
//

import SwiftUI

struct TemperatureView: View {
    @State var showDescription = false
    @ObservedObject var viewModel: WeatherViewModel
    @State var data = [ForeList]()
    let mockup = [
        ForeList(dt: 0000000000, main: MainClass(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, seaLevel: 0, grndLevel: 0, humidity: 0), weather: [Weather(id: 0, main: "Clouds", description: "overcast clouds", icon: "00")], clouds: Clouds(all: 0), wind: Wind(speed: 0, deg: 0, gust: 0), visibility: 0, pop: 0, dtTxt: "00"),
    ]
    var body: some View {
        VStack(alignment:.leading){
            Text("5-DAY FORECAST")
                .font(.system(size:20, weight: .bold, design: .rounded))
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach((viewModel.forecastModel?.list ?? mockup), id: \.dtTxt){ data in
                        Button(action: {
                           showDescription = true
                            print(data)
                            self.data = [data]
                        }){
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 18)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color("Purpil"),Color("Bluevy")]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing)
                                )
                                .shadow(
                                    color: Color.black.opacity(0.2) ,
                                    radius: 5,x:0,y:5)
                                .frame(width: 165 , height: 88)
                        
                            VStack(spacing: 10){
                                Text(data.dtTxt.convertToDisplayDayFormat())
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.white)
                                    .opacity(0.8)
                                HStack(spacing: 20) {
                                    VStack(spacing: 10) {
                                        Text("H:  \(Int(data.main.tempMax ?? 0))°C")
                                            .font(.system(size: 12, weight: .bold, design: .rounded))
                                            .foregroundColor(Color.white)
                                        
                                        Text("L:   \(Int(data.main.tempMin ?? 0))°C")
                                            .font(.system(size: 12, weight: .bold, design: .rounded))
                                            .foregroundColor(Color.white)
                                    }
                                   
                                    convertWeatherIconFromId(data.weather.first?.icon ?? "").resizable().scaledToFit().frame(width:35, height:35)
                                }
                               
                            }
                            }.padding()
                            
                        }.sheet(isPresented: $showDescription) {
                            DescriptionView(foreList: $data).presentationDetents([.large])
                        }
                    }
                }
            }
        }.padding()
          
    }
}

