//
//  NSObjectExtension.swift
//  Weather
//
//  Created by Sargis on 6/21/20.
//  Copyright © 2020 Sargis. All rights reserved.
//

import Foundation

extension NSObject{
    
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String{
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

