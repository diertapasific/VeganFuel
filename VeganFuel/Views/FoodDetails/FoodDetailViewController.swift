//
//  FoodDetailViewController.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 01/12/23.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodDetailImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodCaloriesLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var food: Foods!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
    }
    
    private func populateView(){
        ratingImageView.image = UIImage(named: food.ratingImage)
        foodTitleLabel.text = food.name
        foodDescriptionLabel.text = food.description
        foodCaloriesLabel.text = food.formattedCalories
        foodDetailImageView.image = UIImage(named: food.image)
    }
    
    @IBAction func orderBtnOnClicked(_ sender: Any) {
        
    }
    
}
