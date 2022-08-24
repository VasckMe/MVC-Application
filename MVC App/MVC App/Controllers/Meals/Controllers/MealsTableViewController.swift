//
//  MealsTableViewController.swift
//  MVC App
//
//  Created by Apple Macbook Pro 13 on 24.08.22.
//

import UIKit

final class MealsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil),
                           forCellReuseIdentifier: MealTableViewCell.identifier)

        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func callAlert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        DataMeals.shared.categories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataMeals.shared.meals[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MealTableViewCell.identifier,
                for: indexPath) as? MealTableViewCell else { return UITableViewCell() }
        let meal = DataMeals.shared.meals[indexPath.section][indexPath.row]
        cell.refresh(model: meal)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = DataMeals.shared.categories[section]

        let myView = UIView()
        myView.backgroundColor = .clear

        let label = UILabel(frame: CGRect(x: 20, y: 3, width: 300, height: 20))
        label.text = title + " " + "\(DataMeals.shared.meals[section].count)"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)

        myView.addSubview(label)
        return myView
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataMeals.shared.meals[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        guard
            fromIndexPath.section == to.section
        else {
            callAlert(title: "Warning", message: "dont mowe meal to another categories!", style: .alert)
            tableView.reloadData()
            tableView.isEditing = false
            return
        }
        let meal = DataMeals.shared.meals[fromIndexPath.section].remove(at: fromIndexPath.row)
        DataMeals.shared.meals[to.section].insert(meal, at: to.row)
        tableView.reloadData()
    }
        
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToDetailMealVC", sender: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let detailMealVC = segue.destination as? DetailMealViewController,
            let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "GoToDetailMealVC"
        else { return }
        let meal = DataMeals.shared.meals[indexPath.section][indexPath.row]
        detailMealVC.meal = meal
    }
}
