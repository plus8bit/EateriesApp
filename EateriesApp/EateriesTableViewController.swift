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
        
        return cell
    }

}
