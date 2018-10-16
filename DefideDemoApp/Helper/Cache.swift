//
//  Cache.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/12/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation

class Cache{
    private static var cache = NSCache<AnyObject, AnyObject>()
    
    static func add(key:AnyObject, object:AnyObject){
        cache.setObject(object, forKey: key)
    }
    
    static func get(key:AnyObject)->AnyObject?{
        return cache.object(forKey: key)
    }
    
}
