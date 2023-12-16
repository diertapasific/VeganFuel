//
//  Foods.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import Foundation

struct Foods{
    let id: String
    let name: String
    let image: String
    let calories: Int
    let description: String
    let price: String
    let ratingImage: String
    
    var formattedCalories: String{
        return String(format: "%d calories", calories ?? 0)
    }
}
