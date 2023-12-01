//
//  OnboardingViewController.swift
//  VeganFuel
//
//  Created by Dierta Pasific on 30/11/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if (currentPage == slides.count - 1){
                nextBtn.setTitle("Get Started", for: .normal)
            } else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        
        slides = [
            OnboardingSlide(title: "Welcome to VeganFuel", description: "Dive into a world of delectable vegan cuisine.", image: "onboarding-1" ),
            OnboardingSlide(title: "Convenient Delivery", description: "Delicious vegan delivered to your doorstep.", image: "onboarding-2" ),
            OnboardingSlide(title: "Exclusive Offers", description: "We love treating you to a little extra!.", image: "onboarding-3" )
        ]
        
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == slides.count - 1{
            // Move page from onboarding to next page
            let controller = storyboard?.instantiateViewController(identifier: "LoginNavigationViewController") as! UINavigationController
            present(controller, animated: true, completion: nil)
        } else{
            currentPage += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(
                at: IndexPath(item: currentPage, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
            collectionView.isPagingEnabled = true
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slide: slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width) 
    }
}
