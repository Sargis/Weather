//
//  CityRouter.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import UIKit

class CityRouter: CityWireframeProtocol {

    weak var viewController: CityViewController?

    static func createModule(_ city: City) -> CityViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = CityViewController(nibName: nil, bundle: nil)
        let interactor = CityInteractor()
        let router = CityRouter()
        let presenter = CityPresenter(interface: view, interactor: interactor, router: router, city: city)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
