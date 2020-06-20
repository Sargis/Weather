//
//  Weather.swift
//  Weather
//
//  Created by Sargis on 6/21/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import Foundation

class Weather {
    
    let summary: String
    let icon: String
    let dates: [Data]
    
    init(json: JSON) {
        self.summary = json["summary"].stringValue
        self.icon = json["icon"].stringValue
        self.dates = json["data"].arrayValue.map({Data.init(json: $0)})
    }
    class Data {
        
        let time: Date
        let icon: String
        let precipType: String
        let temperatureMin: Int
        
        init(json: JSON) {
            self.time = Date.init(timeIntervalSince1970: json["time"].doubleValue)
            self.icon = json["icon"].stringValue
            self.precipType = json["precipType"].stringValue
            self.temperatureMin = json["temperatureMin"].intValue
        }
        
    }
}
