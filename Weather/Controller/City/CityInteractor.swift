//
//  CityInteractor.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import UIKit
import Alamofire

class CityInteractor: CityInteractorInputProtocol {
    
    weak var presenter: CityInteractorOutputProtocol?
    
    func loadWeather(_ city: City) {
        let base = "https://api.darksky.net/forecast/3e7e519ea86c8e3fcf67c0f4870513d7/"
        let loationStr = "\(city.location.0),\(city.location.1)?lang=ru"
        let url = "\(base)\(loationStr)"
        AF.request(url)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON.init(value)
                    let weather = Weather.init(json: json["daily"])
                    self.presenter?.receivedWeather(weather)
                case .failure(let error):
                    self.presenter?.receivedError(error)
                }
        }
    }
}
