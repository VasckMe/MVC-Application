//
//  FeedbackViewController.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet private weak var feedbackTextView: UITextView!
    @IBOutlet private weak var markSegment: UISegmentedControl!
    @IBOutlet private weak var textViewErrorLabel: UILabel!
    @IBOutlet private weak var saveButtonOutlet: UIButton!
    
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackTextView.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        feedbackTextView.layer.borderWidth = 2
        feedbackTextView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        feedbackTextView.textColor = .white
        feedbackTextView.layer.cornerRadius = 15
        
    }

    @IBAction func saveAction() {
        guard let index = indexPath else {
            return
        }
        
        let feedback = Feedback(
            mark: Mark(rawValue: markSegment.selectedSegmentIndex) ?? .taste,
            text: feedbackTextView.text
        )
        DataMeals.shared.meals[index.section][index.row].feedbacks.append(feedback)
    }
}

extension FeedbackViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedbackTextView {
            let isCountEnough = textView.text.count > 20
            textViewErrorLabel.isHidden = isCountEnough
            saveButtonOutlet.isEnabled = isCountEnough
        }
        return true
    }
}
