//
//  BarChartsDescView.swift
//  Weath App
//
//  Created by Yadar Tulayathamrong on 15/5/2566 BE.
//

import SwiftUI

struct BarChartDescView: View {
    var body: some View {
        VStack(spacing:20){
            VStack(alignment:.leading,spacing: 25){
                Text("Morning (5:00 am to 11:59 pm): During this time range, the AQI can vary depending on several factors such as traffic, industrial activities, and weather conditions. Usually, the AQI is at its highest during the morning rush hour due to increased traffic, emissions from vehicles, and industrial activities.").multilineTextAlignment(.leading)
                Text("Evening (6:00 pm to 9:59 pm): The AQI during this time range can be similar to the afternoon hours, but it may start to improve as the traffic and industrial activities start to decrease. However, the AQI can still be high if there are wildfires, burning of crop residue, or other sources of pollution.").multilineTextAlignment(.leading)
                Text("Afternoon (12:00 pm to 5:59 pm): The AQI during this time range can be similar to the morning hours, but it may improve slightly if there are weather conditions that help to disperse pollutants. However, it's important to note that the AQI can still be high due to ongoing industrial activities and traffic.").multilineTextAlignment(.leading)
                Text("Night (10:00 pm to 4:59 am): During this time range, the AQI can be relatively low, but it can still be affected by local sources of pollution such as industrial activities and traffic. However, the AQI may improve as the night progresses due to reduced activity and weather conditions that help to disperse pollutants.").multilineTextAlignment(.leading)
            }.font(.system(size: 16, weight: .regular))
                .foregroundColor(Color("TextColor"))
                
            
        }.padding()
    }
}

