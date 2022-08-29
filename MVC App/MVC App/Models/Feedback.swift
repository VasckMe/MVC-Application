//
//  Feedback.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import Foundation

struct Feedback {
    
    // MARK: Internal properties
    
    let date = Date()
    
    let mark: Mark
    let text: String
    
    var markString: String {
        String(repeating: "⭐", count: mark.rawValue)
    }
    
    var feedbackTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: date)
    }
}
