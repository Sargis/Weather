//
//  CityViewController.swift
//  Weather
//
//  Created Sargis on 6/20/20.
//  Copyright © 2020 Sargis. All rights reserved.
//


import UIKit
import ESPullToRefresh

class CityViewController: UITableViewController {

	var presenter: CityPresenterProtocol?
 
	override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.es.addPullToRefresh { 
            self.presenter?.getWeather()
        }
        self.tableView.es.startPullToRefresh()
        self.tableView.register(cellNib: WeatherTableViewCell.self)
    }

}

//MARK:- Self
extension CityViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.weather?.dates.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(cell: WeatherTableViewCell.self, for: indexPath)
        let data = self.presenter!.weather!.dates[indexPath.row]
        cell.update(data)
        return cell
    }

}

//MARK:- CityViewProtocol
extension CityViewController: CityViewProtocol {
    
    func presentError(_ error: Error) {
        self.presentAlert(error.localizedDescription)
    }
    
    func updateData() {
        self.tableView.reloadSections([0], with: .automatic)
    }
}
