//
//  DataMeals.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import Foundation

class DataMeals {
    static let shared = DataMeals()
    
    var categories = ["Fruits","Vegetables","Berries"]
    var meals = [[Meal]]()
    
    private init() {
        meals = [
            [Meal(name: "Apple", price: 0.65, image: #imageLiteral(resourceName: "apple")),
             Meal(name: "Orange", price: 0.75, image: #imageLiteral(resourceName: "orange")),
             Meal(name: "Banana", price: 0.90, image: #imageLiteral(resourceName: "bananas")),
             Meal(name: "Mango", price: 0.80, image: #imageLiteral(resourceName: "mango"))],
            
            [Meal(name: "Cucumber", price: 0.75, image: #imageLiteral(resourceName: "cucumber"))],
            
            [Meal(name: "Apple", price: 1.80, image: #imageLiteral(resourceName: "raspberry")),
             Meal(name: "Orange", price: 2.10, image: #imageLiteral(resourceName: "blackberry")),
             Meal(name: "Melon", price: 3.40, image: #imageLiteral(resourceName: "water-melon")),
             Meal(name: "Mango", price: 2.00, image: #imageLiteral(resourceName: "strawberry"))]
        ]
    }
}
