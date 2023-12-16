//
//  HomeViewController.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 30/11/23.
//

import UIKit
import Firebase

class HomeViewController: UIViewController  {

    @IBOutlet weak var userGreetingLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Noodles", image: "noodleCategory"),
        .init(id: "id2", name: "Snacks", image: "snackCategory"),
        .init(id: "id3", name: "Salads", image: "saladCategory"),
        .init(id: "id4", name: "Cakes", image: "cakeCategory"),
        .init(id: "id5", name: "Pizzas", image: "pizzaCategory"),
        .init(id: "id6", name: "Beverages", image: "beverageCategory"),
        .init(id: "id7", name: "Soups", image: "soupCategory"),
    ]
    
    // Datasource for popular dishes
    var populars: [Foods] = [
        .init(id: "id1", name: "Mushroom Pizza", image: "mushroomPizza", calories: 520, description: "• Pizza dough (1 ball)\n• Olive oil (2 tablespoons)\n• Tomato sauce (1/2 cup)\n• Vegan cheese (1 cup)\n• Mushrooms (1 cup, sliced)\n• Red onion (1/2, thinly sliced)\n• Garlic (2 cloves, minced)\n• Fresh basil (1/4 cup, chopped)\n• Balsamic glaze (2 tablespoons)\n• Salt (to taste)\n• Pepper (to taste)\n• Oregano (1 teaspoon)\n• Vegan Parmesan (1/4 cup)\n• Cornmeal (for dusting)\n• Arugula (1 cup)", price: "IDR 95.000", ratingImage: "fourRating"),
        .init(id: "id2", name: "Vegan Sushi", image: "veganSushi", calories: 260, description: "• 10 Nori sheets\n• 2 cups Sushi rice\n• 1 Avocado\n• 1 Carrot\n• 1/2 Cucumber\n• 1/2 Red bell pepper\n• 2 tablespoons Sesame seeds\n• 1/4 cup Soy sauce\n• Pickled ginger (to taste)\n• Wasabi (to taste)\n• 2 tablespoons Rice vinegar\n• 1 tablespoon Maple syrup\n• 2 tablespoons Tamari\n• 3 Scallions\n• Sriracha (to taste)", price: "IDR 55.000", ratingImage: "fiveRating"),
        .init(id: "id3", name: "Vegan Guacamole", image: "veganGuacamole", calories: 80, description: "• Ripe avocados (3)\n• Red onion (1/2 cup, finely diced)\n• Fresh cilantro (1/4 cup, chopped)\n• Lime juice (2 limes)\n• Garlic (2 cloves, minced)\n• Tomatoes (2, diced)\n• Jalapeño (1, finely chopped)\n• Salt (1/2 teaspoon)\n• Ground black pepper (1/4 teaspoon)\n• Cumin (1/2 teaspoon)\n• Paprika (1/4 teaspoon)\n• Cayenne pepper (1/8 teaspoon)\n• Corn (1/2 cup, cooked)\n• Radishes (3, thinly sliced)\n• Tortilla chips", price: "IDR 65.000", ratingImage: "fourRating"),
        .init(id: "id4", name: "Vegan Udon", image: "veganUdon", calories: 450, description: "• Udon noodles (8 oz)\n• Soy sauce (3 tbsp)\n• Mirin (2 tbsp)\n• Rice vinegar (1 tbsp)\n• Sesame oil (1 tbsp)\n• Maple syrup (1 tbsp)\n• Garlic (3 cloves, minced)\n• Ginger (1 tbsp, grated)\n• Mushrooms (1 cup, sliced)\n• Bok choy (2 heads, chopped)\n• Carrots (1 cup, julienned)\n• Green onions (1/2 cup, chopped)\n• Vegetable broth (4 cups)\n• Sriracha (1 tsp, optional)\n• Sesame seeds (1 tbsp, for garnish)", price: "IDR 45.000", ratingImage: "fourRating")
    ]
    
    // Datasource for chef special
    var specials: [Foods] = [
        .init(id: "id1", name: "White Pizza", image: "whitePizza", calories: 550, description: "• 1 pizza dough\n• 2 tablespoons olive oil\n• 3 garlic cloves, minced\n• 1 cup vegan ricotta cheese\n• 1 cup vegan mozzarella cheese, shredded\n• 1 cup spinach, chopped\n• 1/2 cup cherry tomatoes, sliced\n• 1/2 cup artichoke hearts, drained and chopped\n• 1/4 cup red onion, thinly sliced\n• Salt, to taste\n• Pepper, to taste\n• 2 tablespoons nutritional yeast\n• Fresh basil, for garnish\n• 1 tablespoon lemon juice\n• Crushed red pepper flakes, optional", price: "IDR 85.000", ratingImage: "fourRating"),
        .init(id: "id2", name: "Vegan Tiramisu", image: "veganTiramisu", calories: 500, description: "• Vegan sponge cake\n• 1 cup brewed espresso, cooled\n• 1/4 cup maple syrup\n• 1/4 cup almond milk\n• 1 tablespoon instant coffee powder\n• 1 cup cashews, soaked and drained\n• 1/2 cup coconut cream\n• 1/4 cup maple syrup\n• 2 teaspoons vanilla extract\n• 1/4 cup coconut oil, melted\n• Cocoa powder for dusting\n• Vegan chocolate chips (optional)\n• Fresh berries for garnish\n• Mint leaves for garnish", price: "IDR 55.000", ratingImage: "fiveRating"),
        .init(id: "id3", name: "Miso Ramen", image: "misoRamen", calories: 380, description: "• Vegan ramen noodles\n• 3 tablespoons miso paste\n• 4 cups vegetable broth\n• 2 tablespoons soy sauce\n• 1 tablespoon sesame oil\n• 3 cloves garlic, minced\n• 1 tablespoon ginger, grated\n• 1 cup shiitake mushrooms, sliced\n• 2 cups bok choy, chopped\n• 1 cup carrots, julienned\n• 4 green onions, sliced\n• 1 cup tofu, cubed\n• 2 nori sheets\n• Sriracha sauce to taste\n• Sesame seeds for garnish", price: "IDR 55.000", ratingImage: "threeRating")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize title
        title="VeganFuel"
        if let navigationBar = navigationController?.navigationBar {
            let customColor = UIColor(
                red: CGFloat(67)/255.0,
                green: CGFloat(83)/255.0,
                blue: CGFloat(52)/255.0,
                alpha: 1.0
            )
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: customColor]
        }
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self

        chefSpecialCollectionView.dataSource = self
        chefSpecialCollectionView.delegate = self
        
        registerCells()
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        popularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        
        chefSpecialCollectionView.register(UINib(nibName: "ChefSpecialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ChefSpecialCollectionViewCell")
    }
    
    @IBAction func logoutBtnOnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                present(LoginViewController, animated: true, completion: nil)
            }
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case chefSpecialCollectionView:
            return specials.count
        default:
            return 0
        }
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
            
            cell.setup(food: populars[indexPath.row])
            return cell
        case chefSpecialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChefSpecialCollectionViewCell", for: indexPath) as! ChefSpecialCollectionViewCell
            
            cell.setup(food: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let controller = FoodListViewController.instantiate()
            navigationController?.pushViewController(controller, animated: true)
            controller.category = categories[indexPath.row]
        } else {
            let controller = FoodDetailViewController.instantiate()
            
            controller.food = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
