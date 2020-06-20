//
//  UIViewControllerExtension.swift
//  Weather
//
//  Created by Sargis on 6/21/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(_ message: String) {
        let controller = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .default))
        self.present(controller, animated: true)
    }
}
