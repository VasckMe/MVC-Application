//
//  ReviewTableViewController.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 25.08.22.
//

import UIKit

class ReviewTableViewController: UITableViewController {

    // MARK: Properties
    var indexPathOfMeal: IndexPath?
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: ReviewTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: ReviewTableViewCell.identifier)
        
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let indexPath = indexPathOfMeal else { return 0 }
        let meal = DataMeals.shared.meals[indexPath.section][indexPath.row]
        return meal.feedbacks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let indexPathOfMeal = indexPathOfMeal,
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReviewTableViewCell.identifier,
                for: indexPath) as? ReviewTableViewCell else { return UITableViewCell() }
        let meal = DataMeals.shared.meals[indexPathOfMeal.section][indexPathOfMeal.row]
        let feedback = meal.feedbacks[indexPath.row]
        cell.refresh(model: feedback)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataMeals.shared.meals[indexPathOfMeal!.section][indexPathOfMeal!.row].feedbacks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToDetailReviewVC", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let feedback = DataMeals.shared.meals[indexPathOfMeal!.section][indexPathOfMeal!.row].feedbacks.remove(at: fromIndexPath.row)
        DataMeals.shared.meals[indexPathOfMeal!.section][indexPathOfMeal!.row].feedbacks.insert(feedback, at: to.row)
        tableView.reloadData()

    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard
            let detailReviewVC = segue.destination as? DetailReviewViewController,
            let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "GoToDetailReviewVC" else { return }
        detailReviewVC.indexPath = indexPath
        detailReviewVC.meal = DataMeals.shared.meals[indexPathOfMeal!.section][indexPathOfMeal!.row]
    }
}
