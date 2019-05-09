//
//  EateriesTableViewController.swift
//  EateriesApp
//
//  Created by Nick on 09/05/2019.
//  Copyright © 2019 Nick Danilov. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    let restaurantNames = ["DANDELYAN", "AMERICAN BAR", "MANHATTAN", "THE NOMAD", "CONNAUGHT BAR", "BAR TERMINI", "THE CLUMSIES", "ATLAS", "DANTE", "THE OLD MAN", "LICORERIA LIMANTOUR", "HIGH FIVE", "NATIVE", "ATTABOY", "THE DEAD RABBIT"]
    
    let restaurantImages = ["Dandelyan.jpg", "American_Bar.jpg", "Manhattan-Interior.jpg", "The_NoMad_Bar_Daniel_Krieger.jpg", "Connaught.jpg", "Bar-Termini.jpg", "TheClumsies.jpg", "Atlas.jpg", "Dante.jpg", "The_Old_Man_1.jpg", "Limantour_Exterior_1.jpg", "HighFive.jpg", "Native2.jpg", "Attaboy.jpg", "TheDeadRabbit.jpg"]
    
    var restaurantIsVisited = [Bool](repeatElement(false, count: 15))

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbnailImageView.layer.cornerRadius = 13
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurantNames[indexPath.row]
        
        cell.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
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
    

}
