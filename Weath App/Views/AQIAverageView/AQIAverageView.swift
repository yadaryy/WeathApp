
import SwiftUI

struct AQIAverageView: View {
    @StateObject var aqiDataViewModel = AQIDataManager()
    @StateObject var airVM = AirQualityViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Daily Average")
                .font(.system(size:24, weight: .bold, design: .rounded)).padding()
        
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        Color("Purpil")
                    ) .shadow(
                        color: Color.black.opacity(0.2) ,
                        radius: 5,x:0,y:5)
                    .frame(width: 335 , height: 215)
                    .padding()
                VStack {
                    BarChartView(aqiDataViewModel: aqiDataViewModel)
                            .padding()
                      
                }
            }
        }.padding()
            .onAppear {
                aqiDataViewModel.fetchFirestoreData()
    }
    }
}


