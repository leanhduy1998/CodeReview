//
//  PhotoViewModel.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation
import UIKit

class PhotoViewModel{
    var url:URL!
    
    init(photo:Photo){
        self.url = URL(string: photo.url)
    }
}
