

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @Binding var searchText : String
    @Binding var showLocationSearhView : Bool
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.gray : Color.purple
                )
            
            TextField("Search your location...", text: $searchText)
                .foregroundColor(Color("TextColor"))
                .overlay(
                    Image(systemName: "location.fill")
                        .foregroundColor(
                            Color(.systemGray3))
                        .offset(x:80)
                        .opacity(searchText.isEmpty ?
                                 1.0 : 0.0)
               )
            
          
            
            Button(action: {
                UIApplication.shared.endEditing()
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
            }
            .foregroundColor(Color.purple)
            .opacity(
                      searchText.isEmpty ?
                      0.0 : 1.0
            )
            
            
            Button(action: {
                   searchText = ""
                  UIApplication.shared.endEditing()
                  showLocationSearhView = false
            }) {
               Text("Cancel")
            }
            .foregroundColor(Color.purple)
            .opacity(
                showLocationSearhView || !searchText.isEmpty  ?
                1.0 : 0.0
            )
            
            
            
           
               
            
        }.padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray5))
                    
        ).padding()
    }
}
