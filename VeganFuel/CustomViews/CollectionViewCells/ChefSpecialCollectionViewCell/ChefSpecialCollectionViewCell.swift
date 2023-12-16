//
//  ChefSpecialCollectionViewCell.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import UIKit

class ChefSpecialCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foodChefImageView: UIImageView!
    
    func setup(food: Foods){
        titleLabel.text = food.name
        caloriesLabel.text = food.formattedCalories
        foodChefImageView.image = UIImage(named: food.image)
        ratingImageView.image = UIImage(named: food.ratingImage)
    }
}
