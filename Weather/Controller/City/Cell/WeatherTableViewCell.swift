//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Sargis on 6/21/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var temperatureLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    
    func update(_ data: Weather.Data) {
        self.temperatureLabel.text = "\(data.temperatureMin)C"
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "E, d MMM"
        self.dateLabel.text = dateFormatter.string(from: data.time)
    }
    
}
