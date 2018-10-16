//
//  Photo.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation
import UIKit

class Photo{
    // store as String instead of URL because updating to the cloud (Firebase for example) as String is easier
    var url:String!
    //TODO: add more info like name, tags, bloggers, etc
    
    init(url:String){
        self.url = url
    }
}
