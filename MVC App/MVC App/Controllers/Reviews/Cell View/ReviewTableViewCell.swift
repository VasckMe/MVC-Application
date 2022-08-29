//
//  ReviewTableViewCell.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 25.08.22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var markLabel: UILabel!
    
    static let identifier = "ReviewTableViewCell"
    
    // MARK: Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refresh(model: Feedback) {
        dataLabel.text = model.feedbackTime
        commentLabel.text = model.text
        markLabel.text = model.markString
    }
    
}
