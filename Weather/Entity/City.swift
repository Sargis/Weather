//
//  City.swift
//  Weather
//
//  Created by Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import Foundation

enum City: String {
    
    case peterburg
    case moscow
    
    var description: String {
        switch self {
        case .peterburg: return "Санкт- Петербургъ"
        case .moscow: return "Москва"
        }
    }
 
    var location: (Double, Double) {
        switch self {
        case .peterburg: return (59.950015, 30.316599)
        case .moscow: return (55.753913, 37.620836)
        }
    }
    
}
