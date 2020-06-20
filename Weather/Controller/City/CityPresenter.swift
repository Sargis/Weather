//
//  CityPresenter.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import UIKit

class CityPresenter: CityPresenterProtocol {
    
    weak private var view: CityViewProtocol?
    var interactor: CityInteractorInputProtocol?
    private let router: CityWireframeProtocol
    
    var city: City
    var weather: Weather?
    
    init(interface: CityViewProtocol, interactor: CityInteractorInputProtocol?, router: CityWireframeProtocol, city: City) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.city = city
    }
    
    func getWeather() {
        self.interactor?.loadWeather(self.city)
    }
    
}

//MARK:- CityInteractorOutputProtocol
extension CityPresenter: CityInteractorOutputProtocol {
    
    func receivedError(_ error: Error) {
        self.view?.presentError(error)
    }
    
    func receivedWeather(_ weather: Weather) {
        self.weather = weather
        self.view?.updateData()
    }
}
