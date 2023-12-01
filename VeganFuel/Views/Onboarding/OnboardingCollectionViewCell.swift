//
//  OnboardingCollectionViewCell.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 30/11/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideTItleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setup(slide: OnboardingSlide){
        slideImageView.image = UIImage(named: slide.image)
        slideTItleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
