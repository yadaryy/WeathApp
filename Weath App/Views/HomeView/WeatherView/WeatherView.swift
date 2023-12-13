

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Today")
                .font(.system(size:22, weight: .bold, design: .rounded))
       
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
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
                            .frame(width: 65 , height: 88)
                        VStack(spacing: 5){
                            Image("Wind").resizable()
                                .scaledToFit()
                                .frame(width: 35 , height: 30)
                            Text("WIND")
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .opacity(0.8)
                                .foregroundColor(Color.white)
                            Text(viewModel.windSpeed)
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding()
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
                            .frame(width: 65 , height: 88)
                        VStack(spacing: 5){
                            Image("Humidity").resizable()
                                .scaledToFit()
                                .frame(width: 35 , height: 30)
                            Text("Humidity")
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .opacity(0.8)
                                .foregroundColor(Color.white)
                            Text(viewModel.humidity)
                                .font(.system(size: 12, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                        .padding()
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
                            .frame(width: 65 , height: 88)
                        VStack(spacing: 5){
                            Image("Sunrise").resizable()
                                .scaledToFit()
                                .frame(width: 35 , height: 30)
                            Text("SUNRISE")
                                .font(.system(size: 10, weight: .bold, design: .rounded)) .opacity(0.8)
                                .foregroundColor(Color.white)
                            Text(viewModel.sunriseTime)
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                        .padding()
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
                            .frame(width: 65 , height: 88)
                        VStack(spacing: 5){
                            Image("Sunset").resizable()
                                .scaledToFit()
                                .frame(width: 35 , height: 30)
                                
                            Text("SUNSET")
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .opacity(0.8)
                                .foregroundColor(Color.white)
                            Text(viewModel.sunsetTime)
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                        .padding()
                    
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
                            .frame(width: 65 , height: 88)
                        VStack(spacing: 5){
                            Image("Visibility").resizable()
                                .scaledToFit()
                                .frame(width: 25 , height: 30)
                            Text("Visibility")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                                .opacity(0.8)
                            Text(viewModel.visibility)
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                        .padding()
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
                            .frame(width: 65 , height: 88)
                        VStack(spacing: 5){
                            Image("Pressure").resizable()
                                .scaledToFit()
                                .frame(width: 25 , height: 30)
                            Text("Pressure")
                                .font(.system(size: 12, weight: .bold, design: .rounded))
                                .foregroundColor(Color.white)
                                .opacity(0.8)
                            Text(viewModel.pressure)
                                .font(.system(size: 12, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.white)
                                
                        }
                    }
                        .padding()
                }
            }
        }.padding()
           
          
    }
}
