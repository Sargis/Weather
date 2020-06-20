//
//  CityPresenter.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import UIKit

class CityPresenter: CityPresenterProtocol, CityInteractorOutputProtocol {
    
    weak private var view: CityViewProtocol?
    var interactor: CityInteractorInputProtocol?
    private let router: CityWireframeProtocol
    
    var city: City
    
    init(interface: CityViewProtocol, interactor: CityInteractorInputProtocol?, router: CityWireframeProtocol, city: City) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.city = city
    }
    
}
