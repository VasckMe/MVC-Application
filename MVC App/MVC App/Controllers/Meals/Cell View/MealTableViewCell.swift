//
//  MealTableViewCell.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import UIKit

final class MealTableViewCell: UITableViewCell {

    static let identifier = "MealTableViewCell"
    
    @IBOutlet private weak var mealImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var markLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        priceLabel.layer.borderWidth = 2
        priceLabel.layer.cornerRadius = 15
        priceLabel.layer.borderColor = #colorLiteral(red: 0.4988286495, green: 0.7597540021, blue: 0.003986309282, alpha: 1)
    }
    
    func refresh(model: Meal) {
        mealImageView.image = model.image
        titleLabel.text = model.name
        markLabel.text = model.markString
        priceLabel.text = model.price.description + " BYN"
    }
}
