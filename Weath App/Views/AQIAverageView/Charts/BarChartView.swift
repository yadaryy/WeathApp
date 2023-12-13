
import SwiftUI
import Charts

struct BarChartView: View {
    @ObservedObject var aqiDataViewModel: AQIDataManager
    @State var showDescription = false
    
    var body: some View {
        Button(action: {
           showDescription = true
        }){
            HStack(){
                Chart {
                    ForEach(aqiDataViewModel.data.keys.sorted(), id: \.self) { key in
                        BarMark(
                            x: .value("Time", key),
                            y: .value("Aqi", Int(aqiDataViewModel.data[key]!))
                        )
                        .foregroundStyle(Color("Orangy"))
                    }
                }
            }.padding()
            .sheet(isPresented: $showDescription) {
                BarChartDescView().presentationDetents([.large])
            }
        }
    }
}




