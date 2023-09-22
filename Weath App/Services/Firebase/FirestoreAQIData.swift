//
//  FirestoreManager.swift
//  Weath App
//
//  Created by Setthasit Poosawat on 5/3/23.
//

import Firebase

struct FirestoreAQIData: Codable {
    let latitude: Double?
    let longitude: Double?
    let aqi: Int?
    let components: AirQualityData.AirQualityInfo.Components?
    let timestamp: TimeInterval?
}
