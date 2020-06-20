//
//  UITableViewExtension.swift
//  Weather
//
//  Created by Sargis on 6/21/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func cell<T: UITableViewCell>(cell class : T.Type, for indexPath: IndexPath) -> T {
        if let cell = self.dequeueReusableCell(withIdentifier: `class`.nameOfClass, for: indexPath) as? T {
            return cell
        }
        fatalError("Could not load cell \(`class`) from nib")
    }
    
    func register<T: UITableViewCell>(cellNib class : T.Type) {
        let nib = UINib.init(nibName: `class`.nameOfClass, bundle: nil)
        self.register(nib, forCellReuseIdentifier: `class`.nameOfClass)
    }
    
}
