//
//  AirStatusColorConverter.swift
//  Weath App
//
//  Created by Yadar Tulayathamrong on 3/5/2566 BE.
//

import Foundation
import SwiftUI

func convertColorFromStatus(_ status: String) -> Color {
    switch status {
    case "Good":
        return Color("Level1")
    case "Moderate":
        return Color("Level2")
    case "Unhealthy for Sensitive Groups":
        return Color("Level3")
    case "Unhealthy":
        return Color("Level4")
    case "Very Unhealthy":
        return Color("Level5")
    case "Hazardous":
        return Color("Level6")
    case "N/A":
        return Color("Bluevy")
    default:
        return Color("Level1")
    }
}
