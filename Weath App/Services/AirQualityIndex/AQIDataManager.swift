//
//  AqiDataViewModel.swift
//  Weath App
//
//  Created by Setthasit Poosawat on 2/5/23.
//

import Combine
import FirebaseFirestore
import Firebase

class AQIDataManager: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var data: [String: CGFloat] = [:]
    @Published var airQualityData: FirestoreAQIData?
    
    // Function to fetch data from Firestore
    func fetchFirestoreData() {
        db.collection("air_quality_data").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.processDocuments(querySnapshot?.documents)
            }
        }
    }
    
    // MARK: - Firestore Data Storing
    // Function to store AirQualityData in Firestore
    func storeAQIDataInFirestore(_ data: AirQualityData) {
        let collection = db.collection("air_quality_data")
        
        for item in data.list {
            let documentData: [String: Any] = [
                "latitude": data.coord.lat,
                "longitude": data.coord.lon,
                "aqi": item.main.aqi,
                "components": [
                    "co": item.components.co,
                    "no": item.components.no,
                    "no2": item.components.no2,
                    "o3": item.components.o3,
                    "so2": item.components.so2,
                    "pm2_5": item.components.pm2_5,
                    "pm10": item.components.pm10,
                    "nh3": item.components.nh3
                ],
                "timestamp": item.dt
            ]
            
            collection.addDocument(data: documentData) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("[Firestore] Document added successfully")
                }
            }
        }
    }
    
    // MARK: - Data Processing
    // Function to process the documents fetched from Firestore
    private func processDocuments(_ documents: [QueryDocumentSnapshot]?) {
        guard let documents = documents else { return }
        
        var aqiData: [FirestoreAQIData] = []
        
        for document in documents {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: document.data(), options: [])
                let decodedData = try JSONDecoder().decode(FirestoreAQIData.self, from: jsonData)
                aqiData.append(decodedData)
            } catch {
                print("[Firestore] Error decoding document: \(error)")
            }
        }
        
        calculateAverageAQI(aqiData)
    }
    
    // Function to calculate the average AQI from the data fetched from Firestore
    private func calculateAverageAQI(_ firestore: [FirestoreAQIData]) {
        let timePeriods: [String] = ["Morning", "Afternoon", "Evening", "Night"]
        var periodAQISum: [String: CGFloat] = [:]
        var periodAQICount: [String: Int] = [:]
        var calculatedData: [String: CGFloat] = [:]

        for data in firestore {
            if let timestamp = data.timestamp, let aqi = data.aqi {
                let date = Date(timeIntervalSince1970: timestamp)
                let period = timePeriod(for: date)

                periodAQISum[period] = (periodAQISum[period] ?? 0) + CGFloat(aqi)
                periodAQICount[period] = (periodAQICount[period] ?? 0) + 1
            }
        }

        for period in timePeriods {
            if let sum = periodAQISum[period], let count = periodAQICount[period] {
                calculatedData[period] = sum / CGFloat(count)
            } else {
                calculatedData[period] = 0
            }
        }

        self.data = calculatedData
    }
    
    private func timePeriod(for date: Date) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        switch hour {
        case 5..<12:
            return "Morning"
        case 12..<17:
            return "Afternoon"
        case 17..<21:
            return "Evening"
        default:
            return "Night"
        }
    }
}
