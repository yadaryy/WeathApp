

import SwiftUI

struct LocationSearchViewCell: View {
    @Binding var city : String
   
    var body: some View {
        Text(city) .font(.system(size:20, weight: .regular, design: .rounded))
        }
    }



