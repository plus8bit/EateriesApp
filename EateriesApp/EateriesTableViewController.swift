//
//  EateriesTableViewController.swift
//  EateriesApp
//
//  Created by Nick on 09/05/2019.
//  Copyright © 2019 Nick Danilov. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "DANDELYAN", type: "Restaurant", location: "London", image: "Dandelyan.jpg", isVisited: false),
        Restaurant(name: "AMERICAN BAR", type: "Bar", location: "London", image: "American_Bar.jpg", isVisited: false),
        Restaurant(name: "MANHATTAN", type: "Restaurant", location: "New York", image: "Manhattan.jpg", isVisited: false),
        Restaurant(name: "THE NOMAD", type: "Restaurant", location: "New York", image: "The_NoMad.jpg", isVisited: false),
        Restaurant(name: "CONNAUGHT BAR", type: "Restaurant", location: "London", image: "Connaught.jpg", isVisited: false),
        Restaurant(name: "BAR TERMINI", type: "Bar", location: "London", image: "Bar-Termini.jpg", isVisited: false),
        Restaurant(name: "THE CLUMSIES", type: "restaurant", location: "Greece", image: "TheClumsies.jpg", isVisited: false),
        Restaurant(name: "ATLAS", type: "restaurant", location: "Georgia", image: "Atlas.jpg", isVisited: false),
        Restaurant(name: "DANTE", type: "restaurant", location: "Boston", image: "Dante.jpg", isVisited: false),
        Restaurant(name: "THE OLD MAN", type: "restaurant", location: "Vietnam", image: "The_Old_Man.jpg", isVisited: false),
        Restaurant(name: "LICORERIA LIMANTOUR", type: "restaurant", location: "Mexico", image: "Limantour.jpg", isVisited: false),
        Restaurant(name: "HIGH FIVE", type: "restaurant", location: "Chicago", image: "HighFive.jpg", isVisited: false),
        Restaurant(name: "NATIVE", type: "restaurant", location: "Colorado", image: "Native.jpg", isVisited: false),
        Restaurant(name: "ATTABOY", type: "restaurant", location: "New York", image: "Attaboy.jpg", isVisited: false),
        Restaurant(name: "THE DEAD RABBIT", type: "restaurant", location: "New York", image: "TheDeadRabbit.jpg", isVisited: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 13
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurants[indexPath.row].name
        
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "Choose an action", preferredStyle: .actionSheet)
        let call = UIAlertAction(title: "Call us: +5555-555-55\(indexPath.row)", style: .default) {
            (action: UIAlertAction) -> Void in
            
            let alertController = UIAlertController(title: nil, message: "Call cannot be completed", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        let isVisitedTitle = self.restaurantIsVisited[indexPath.row] ? "I have not been here" : "I've been here"
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { (alert) in
            let cell = tableView.cellForRow(at: indexPath)
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        }
        
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(call)
        alert.addAction(isVisited)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
     */
 
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            let defaultText = "I'm at \(self.restaurants[indexPath.row].name) now"
            if let image = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return [delete, share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! EateryDetailViewController
                destinationVC.imageName = self.restaurants[indexPath.row].image
            }
        }
    }
    
    


    
    
    
 
    
    
    
    
    
    

}
