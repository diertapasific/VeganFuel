//
//  CardView.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import Foundation
import UIKit

class CardView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    
    private func initalSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
        cornerRadius = 10
    }
    
}
