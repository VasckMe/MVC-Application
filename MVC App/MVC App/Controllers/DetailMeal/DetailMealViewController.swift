//
//  DetailMealViewController.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import UIKit

class DetailMealViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var melonLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var markLabel: UILabel!
    @IBOutlet private weak var stackInterfaceOutlet: UIStackView!
    @IBOutlet private weak var checkReviewsOutlet: UIButton!
    
    // MARK: Properties
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMeal()
    }
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if view.bounds.height > view.bounds.width {
            stackInterfaceOutlet.axis = .vertical
        } else {
            stackInterfaceOutlet.axis = .horizontal
        }
    }
    
    private func setupMeal() {
        guard let meal = meal else {
            return
        }
        imageView.image = meal.image
        melonLabel.text = meal.name
        priceLabel.text = String(format: "%.2f", meal.price) + " " + "BYN"
        markLabel.text = meal.markString
        
        let isHasFeedbacks = meal.feedbacks.count != 0
        checkReviewsOutlet.isEnabled = isHasFeedbacks
        checkReviewsOutlet.titleLabel?.text = "Check (\(meal.feedbacks.count)) reviews"
    }
}
