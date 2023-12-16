//
//  CategoryCollectionViewCell.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    func setup(category: DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.image = UIImage(named: category.image)
    }
    
}
