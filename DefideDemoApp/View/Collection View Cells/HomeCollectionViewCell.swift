//
//  HomeCollectionViewCell.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photoViewModel:PhotoViewModel! = nil{
        didSet{
            photoImageView.setImageFromURL(url: photoViewModel.url)
        }
    }
}
