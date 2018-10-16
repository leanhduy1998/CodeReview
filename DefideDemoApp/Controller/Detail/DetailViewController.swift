//
//  DetailViewController.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/12/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    var photo:Photo!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.setImageFromURL(url: URL(string: photo!.url)!)
    }
}
