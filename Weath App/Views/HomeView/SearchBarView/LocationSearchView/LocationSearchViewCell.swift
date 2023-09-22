//
//  LocationSearchViewCell.swift
//  Weath App
//
//  Created by Yadar Tulayathamrong on 9/3/2566 BE.
//

import SwiftUI

struct LocationSearchViewCell: View {
    @Binding var city : String
   
    var body: some View {
        Text(city) .font(.system(size:20, weight: .regular, design: .rounded))
        }
    }



