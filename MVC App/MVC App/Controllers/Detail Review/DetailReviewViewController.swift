//
//  DetailReviewViewController.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 25.08.22.
//

import UIKit

class DetailReviewViewController: UIViewController {

    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var commentLabel: UITextView!
    @IBOutlet private weak var markLabel: UILabel!
    
    var meal: Meal?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        guard
            let indexPath = indexPath,
            let meal = meal
        else {
            return
        }
        let feedback = meal.feedbacks[indexPath.row]
        
        dataLabel.text = feedback.feedbackTime
        commentLabel.text = feedback.text
        markLabel.text = feedback.markString
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
