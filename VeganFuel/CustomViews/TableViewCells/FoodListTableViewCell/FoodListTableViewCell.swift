//
//  FoodListTableViewCell.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import UIKit

class FoodListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodCaloriesLabel: UILabel!
    
    func setup(food: Foods){
        foodCaloriesLabel.text = food.formattedCalories
        foodTitleLabel.text = food.name
        foodImageView.image = UIImage(named: food.image)
        ratingImageView.image = UIImage(named: food.ratingImage)
    }
    
}
