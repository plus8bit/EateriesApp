//
//  EateryDetailViewController.swift
//  EateriesApp
//
//  Created by Nick on 10/05/2019.
//  Copyright © 2019 Nick Danilov. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
    }
    


}
