
import SwiftUI
import AVFoundation


let synthesizer = AVSpeechSynthesizer()

struct DescriptionView: View {
    @Binding var foreList : [ForeList]
    @State var isPlaying = false
    @State var animateGradient: Bool = false
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                ForEach((foreList ) , id: \.dtTxt) { list in
                    VStack(spacing: 10){
                        HStack{
                            Text(list.dtTxt.convertToDisplayFormat()).font(.system(size:20, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                            Button(action: {
                                isPlaying.toggle()
                                let utterance = AVSpeechUtterance(string: ForecastReport(Date:list.dtTxt.convertToDisplayFormat(),H: "\(Int(list.main.tempMax ?? 0))", L: Int(list.main.tempMin ?? 0), Description: "\(list.weather.first?.description.capitalized ?? "")", Feels: Int(list.main.feelsLike ?? 0), Humidity: "\(list.main.humidity ?? 0)%", Wind: "\(Int(list.wind.speed))", Visibility: "\(Int(list.visibility ))", GrL: "\(Int(list.main.grndLevel ?? 0))", SL: "\(Int(list.main.seaLevel ?? 0))"))
                                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                                utterance.rate = 0.5
                                
                                if isPlaying {
                                    synthesizer.speak(utterance)
                                } else  {
                                    synthesizer.stopSpeaking(at: .word)
                                }
                                
                            }) {
                                Image(systemName: "waveform.circle.fill")
                            }
                            .foregroundColor(isPlaying ? Color.yellow :  Color.white)
                        }
                        Text(list.dtTxt.convertToDisplayTimeFormat()).font(.system(size:20, weight: .bold, design: .rounded)).foregroundColor(Color.white)

                  
                       
                    }.padding()

                    VStack{
                        HStack(spacing:20){
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                    
                                
                                    .frame(width: 155 , height: 155)
                                   
                                VStack{
                                    ZStack{
                                        convertWeatherIconFromId(list.weather.first?.icon ?? "").resizable().scaledToFit().frame(width:100, height:100).opacity(0.3)
                                        
                                        Text("\(Int(list.main.temp ?? 0))°C").font(.system(size:40, weight: .bold))
                                    }
                                    
                                    Text("\(list.weather.first?.description.capitalized ?? "")").font(.system(size:14, weight: .bold, design: .rounded))
                                   
                                }.foregroundColor(Color.white)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                   
                                
                                    .frame(width: 155 , height: 155)
                                   
                                VStack(spacing:10){
                                    Text("H:  \(Int(list.main.tempMax ?? 0)) °C").font(.system(size:30, weight: .bold))
                                    Text("L:  \(Int(list.main.tempMin ?? 0)) °C").font(.system(size:30, weight: .bold))
                                }.foregroundColor(Color.white)
                            }
                            
                            
                         
                            
                        }.padding()
                        
                        HStack(spacing:20){
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                    
                                
                                    .frame(width: 155 , height: 155)
                             
                                VStack(spacing:5){
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Image(systemName: "thermometer.medium").resizable()
                                                 .scaledToFit()
                                                 .frame(width: 14 , height: 14)
                                            Text("FEELS LIKE").font(.system(size:14, weight: .bold, design: .rounded))
                                        }.opacity(0.7)
                                    }
                                    
                                    Text("\(Int(list.main.feelsLike ?? 0))°C").font(.system(size:40, weight: .bold))
                                }.foregroundColor(Color.white)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                   
                                
                                    .frame(width: 155 , height: 155)
                                
                                VStack(spacing:5){
                                    VStack(alignment: .leading) {
                                        HStack{
                                           Image(systemName: "drop.fill").resizable()
                                                .scaledToFit()
                                                .frame(width: 14 , height: 14)
                                            Text("HUMIDITY").font(.system(size:14, weight: .bold, design: .rounded))
                                          
                                        }.opacity(0.7)
                                    }
                                   
                                    Text("\(list.main.humidity ?? 0)%").font(.system(size:40, weight: .bold))
                                }.foregroundColor(Color.white)
                            }
                            
                            
                          
                            
                        }.padding()
                        
                        HStack(spacing:20){
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                   
                                    .frame(width: 155 , height: 155)
                               
                                VStack(spacing:5){
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Image(systemName:"wind.snow.circle.fill").resizable()
                                                .scaledToFit()
                                                .frame(width: 14 , height: 14)
                                            Text("WIND").font(.system(size:14, weight: .bold, design: .rounded))
                                           
                                        }.opacity(0.7)
                                    }
                                    
                                    HStack{
                                        Text("\(Int(list.wind.speed))").font(.system(size:40, weight: .bold))
                                        Text("km/h").font(.system(size:26, weight: .bold))
                                    }
                                     
                                }.foregroundColor(Color.white)
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                    
                                
                                    .frame(width: 155 , height: 155)
                              
                                VStack(spacing:5){
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Image(systemName:"eye.fill").resizable()
                                                .scaledToFit()
                                                .frame(width: 14 , height: 14)
                                            Text("VISIBILITY").font(.system(size:14, weight: .bold, design: .rounded))
                                            
                                        }.opacity(0.7)
                                    }
                                    
                                    Text("\(Int(list.visibility )) km")
                                        .font(.system(size:26, weight: .bold))
                                  
                                }.foregroundColor(Color.white)
                            }
                            
                        }.padding()
                        
                        HStack(spacing:20){
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                   
                                
                                    .frame(width: 155 , height: 155)
                                   
                                VStack(spacing:5){
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Image("Pressure").resizable()
                                                .scaledToFit()
                                                .frame(width: 14 , height: 14)
                                            Text("PRESSURE").font(.system(size:14, weight: .bold, design: .rounded))
                                           
                                        }.opacity(0.7)
                                    }
                                    
                                    HStack{
                                        Text("\(Int(list.main.pressure ?? 0))").font(.system(size:30, weight: .bold))
                                        Text("mb").font(.system(size:26, weight: .bold))
                                    }
                                     
                                }.foregroundColor(Color.white)
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color(.white).opacity(0.2)
                                    )
                                    
                                    .frame(width: 155 , height: 155)
                                  
                                VStack(spacing:5){
                                    
                                    Text("\(Int(list.main.grndLevel ?? 0)) mb")
                                        .font(.system(size:26, weight: .bold))
                                    Text("\(Int(list.main.seaLevel ?? 0)) mb")
                                             .font(.system(size:26, weight: .bold))
                                  
                                }.foregroundColor(Color.white)
                            }
                            
                            
                        
                            
                        }.padding()
                        
                    }
                   
                }
            }
        }.frame(maxWidth: .infinity)
        .background{
                LinearGradient(colors: [Color("Purpil"), Color("Bluevy")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                            
                }
            }
        }
    }
}


extension DescriptionView {
    func ForecastReport(Date:String,H: String,L: Int,Description:String,Feels: Int,Humidity:String,Wind:String,Visibility:String,GrL:String,SL:String) -> String {
        let status : String
        if Feels > L {
            status = "hotter"
        } else {
            status = "cooler"
        }
        
        return "On\(Date), high temperature will be around \(H) degrees Celsius, with a low of \(L)degrees Celsius as well. It will be a \(Description) day . However, it will feel slightly \(status) than this, with a real-feel temperature of \(Feels) degrees Celsius. Humidity levels will be at around \(Humidity). Winds will be light today, with a speed of just \(Wind)kilometers per hour. Visibility allows you to see up to \(Visibility) kilometers in the distance.In terms of atmospheric pressure, we're currently at \(GrL) millibar at ground level, . At sea level, the pressure is around \(SL) millibar"
    }
}

