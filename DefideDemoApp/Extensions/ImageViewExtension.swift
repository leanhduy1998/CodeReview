//
//  CustomImageView.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/12/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func setImageFromURL(url:URL){
        let imageFromCache = Cache.get(key: url as AnyObject)
        
        if(imageFromCache == nil){
            Network.sendGETRequestReturnData(url: url) { (data) in
                if(data == nil){
                    return
                }
                
                let image = UIImage(data: data!)
                Cache.add(key: url as AnyObject, object: image!)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        else{
            self.image = imageFromCache as? UIImage
        }
    }
}
