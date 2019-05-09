//
//  EateriesTableViewCell.swift
//  EateriesApp
//
//  Created by Nick on 09/05/2019.
//  Copyright © 2019 Nick Danilov. All rights reserved.
//

import UIKit

class EateriesTableViewCell: UITableViewCell {
    
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
