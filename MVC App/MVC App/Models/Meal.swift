//
//  MealModel.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import UIKit

struct Meal {
    
    // MARK: Internal properties
    
    let name: String
    let price: Double
    let image: UIImage?
    
    var feedbacks: [Feedback] = []

    var markString: String {
        if let averageMark = averageMark {
            return String(repeating: "⭐", count: averageMark)
        } else {
            return "There are no reviews yet"
        }
    }
    
    // MARK: Private properties
    
    private var averageMark: Int? {
        if feedbacks.isEmpty {
            return nil
        } else {
            var average = 0
            for feedback in feedbacks {
                average += feedback.mark.rawValue
            }
            average /= feedbacks.count
            return average
        }
    }
}
