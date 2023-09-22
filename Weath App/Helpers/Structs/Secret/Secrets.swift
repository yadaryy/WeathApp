//
//  Secret.swift
//  Weath App
//
//  Created by Setthasit Poosawat on 15/5/23.
//

import Foundation

struct Secrets {
    static var apiKey: String {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: path),
              let apiKey = config["API_KEY"] as? String else { return "No Key Provided" }
        return apiKey
    }
}
