//
//  PopularCollectionViewCell.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(food: Foods){
        titleLabel.text = food.name
        caloriesLabel.text = food.formattedCalories
        foodImageView.image = UIImage(named: food.image)
        ratingImageView.image = UIImage(named: food.ratingImage)
    }
    
    

}
