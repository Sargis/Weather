//
//  CityViewController.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import UIKit
import ESPullToRefresh

class CityViewController: UITableViewController, CityViewProtocol {

	var presenter: CityPresenterProtocol?
 
	override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.es.addPullToRefresh { 
            self.presenter?.getWeather()
        }
        self.tableView.es.startPullToRefresh()
    }

}
