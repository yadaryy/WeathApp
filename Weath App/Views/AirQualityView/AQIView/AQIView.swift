
import SwiftUI

struct AQIView: View {
    @ObservedObject var airViewModel : AirQualityViewModel
    @ObservedObject var viewModel : WeatherViewModel

    
    var body: some View {
        
        VStack(alignment:.leading){
            Text("Air Quality")
                .font(.system(size:24, weight: .bold, design: .rounded)).padding()
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 18)
                        .fill(
                            convertColorFromStatus(airViewModel.formatAirQualityStatus())
                        )
                        .shadow(
                            color: Color.black.opacity(0.2) ,
                            radius: 5,x:0,y:5)
                        .frame(width: 355 , height: 380)
                    VStack{
                        Text("Bangkok")
                            .font(.system(size: 24, weight: .regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .shadow(
                                color: Color.black,
                                radius: 2,x:0,y:2)
                            .padding()
                        HStack(alignment: .center){
                            Text(airViewModel.airQualityIndex)
                                .font(.system(size: 52, weight: .bold))
                                .foregroundColor(Color.white)
                                .shadow(
                                    color: Color.black.opacity(0.5) ,
                                    radius: 2,x:0,y:1)
                                .padding()
                            
                            Text(airViewModel.formatAirQualityStatus())
                                .font(.system(size:20, weight: .bold, design: .rounded))
                                .foregroundColor(Color.black)
                        }
                        Text("Air Quality Index")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Color.white).opacity(0.8)
                        
                        HStack{
                            
                            VStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(
                                            Color.white
                                        )
                                        .shadow(
                                            color: Color.black.opacity(0.5) ,
                                            radius: 3,x:0,y:3)
                                        .frame(width: 120 , height: 60)
                                    
                                    VStack(alignment: .leading, spacing:5){
                                        HStack(spacing:30){
                                            Text("CO") .font(.system(size:12, weight: .regular, design: .rounded)).foregroundColor(Color.black)
                                            
                                            
                                            Text("µg/m3") .font(.system(size:10, weight: .regular, design: .rounded))
                                                .foregroundColor(Color.gray)
                                        }
                                        Text(airViewModel.co)
                                        .font(.system(size:14, weight: .bold, design: .rounded))
                                        .foregroundColor(Color.black)
                                        Text("Carbon monoxide")                            .font(.system(size: 8, weight: .regular))
                                            .foregroundColor(Color.gray)

                                    }
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(
                                            Color.white
                                        )
                                        .shadow(
                                            color: Color.black.opacity(0.5) ,
                                            radius: 3,x:0,y:3)
                                        .frame(width: 120 , height: 60)
                                    
                                    VStack(alignment: .leading, spacing:5){
                                        HStack(spacing:20){
                                            Text("PM2.5") .font(.system(size:12, weight: .regular, design: .rounded)).foregroundColor(Color.black)
                                            
                                            
                                            Text("µg/m3") .font(.system(size:10, weight: .regular, design: .rounded))
                                                .foregroundColor(Color.gray)
                                        }
                                        Text(airViewModel.pm25)
                                        .font(.system(size:14, weight: .bold, design: .rounded))
                                        .foregroundColor(Color.black)
                                        Text("Fine particulate matter")                            .font(.system(size: 8, weight: .regular))
                                            .foregroundColor(Color.gray)

                                    }
                                }
                            }.padding()
                            
                            VStack{
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(
                                            Color.white
                                        )
                                        .shadow(
                                            color: Color.black.opacity(0.5) ,
                                            radius: 3,x:0,y:3)
                                        .frame(width: 120 , height: 60)
                                    
                                    VStack(alignment: .leading, spacing:5){
                                        HStack(spacing:30){
                                            Text("NO") .font(.system(size:12, weight: .regular, design: .rounded)).foregroundColor(Color.black)
                                            
                                            
                                            Text("µg/m3") .font(.system(size:10, weight: .regular, design: .rounded))
                                                .foregroundColor(Color.gray)
                                        }
                                        Text(airViewModel.no)
                                        .font(.system(size:14, weight: .bold, design: .rounded))
                                        .foregroundColor(Color.black)
                                        Text("Nitrogen monoxide")                            .font(.system(size: 8, weight: .regular))
                                            .foregroundColor(Color.gray)

                                    }
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(
                                            Color.white
                                        )
                                        .shadow(
                                            color: Color.black.opacity(0.5) ,
                                            radius: 3,x:0,y:3)
                                        .frame(width: 120 , height: 60)
                                    
                                    VStack(alignment: .leading, spacing:5){
                                        HStack(spacing:30){
                                            Text("NO2") .font(.system(size:12, weight: .regular, design: .rounded)).foregroundColor(Color.black)
                                            
                                            
                                            Text("µg/m3") .font(.system(size:10, weight: .regular, design: .rounded))
                                                .foregroundColor(Color.gray)
                                        }
                                        Text(airViewModel.no2)
                                            .foregroundColor(Color.black)
                                        .font(.system(size:14, weight: .bold, design: .rounded))
                                        Text("Nitrogen Dioxide")                            .font(.system(size: 8, weight: .regular))
                                            .foregroundColor(Color.gray)

                                    }
                                }
                            }.padding()
                            
                        }
                    }
                }.padding()
  
        }
    }
}


