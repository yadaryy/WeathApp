

import SwiftUI
struct CardView: View {
    @ObservedObject var viewModel: WeatherViewModel

    @State var searchText : String = ""

    var body: some View {
     
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("Purpil"),Color("Bluevy")]),
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .shadow(
                    color: Color.black.opacity(0.3) ,
                    radius: 5,x:0,y:5)
            
                .frame(width: 335 , height: 215)
                .padding()
            HStack{
                VStack(alignment: .leading, spacing:5){
                    
                    Text(viewModel.date)
                        .foregroundColor(Color.white) .font(.system(size: 20, weight: .semibold))
                    
                    Text(viewModel.cityName).foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .light))
                    
                    Text(viewModel.temp)
                        .foregroundColor(Color.white)
                        .font(.system(size: 52, weight: .bold))
                        .opacity(0.9)
                    Text(viewModel.descript)
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                        .shadow(
                            color: Color.gray.opacity(10) ,
                            radius: 5,x:0,y:2)
                    
                }
                
                ZStack{
                    viewModel.weatherIcon.resizable().scaledToFit().frame(width: 120,height: 120)
                }.opacity(0.5)
            }.padding()
                
        }
        }
    }



