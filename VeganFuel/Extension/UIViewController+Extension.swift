//
//  UIViewController+Extension.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import UIKit
import Foundation

extension UIViewController{
    
    static var identifier: String{
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        
        return controller
    }
}
