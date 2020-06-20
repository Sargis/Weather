//
//  CityProtocols.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import Foundation

//MARK: Wireframe -
protocol CityWireframeProtocol: class {

}
//MARK: Presenter -
protocol CityPresenterProtocol: class {

    var interactor: CityInteractorInputProtocol? { get set }
    var city: City { get }
    var weather: Weather? { get set }
    
    func getWeather()
}

//MARK: Interactor -
protocol CityInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func receivedError(_ error: Error)
    func receivedWeather(_ weather: Weather)
    
}

protocol CityInteractorInputProtocol: class {

    var presenter: CityInteractorOutputProtocol?  { get set }
    
    func loadWeather(_ city: City)

    /* Presenter -> Interactor */
}

//MARK: View -
protocol CityViewProtocol: class {

    var presenter: CityPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
