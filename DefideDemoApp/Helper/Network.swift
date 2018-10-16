//
//  Network.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/12/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation

class Network{
    static func sendGETRequestReturnJSON(url:URL,completionHandler: @escaping ([String:Any]?) -> Void){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil)
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                completionHandler(responseJSON)
            }
            else{
                completionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func sendGETRequestReturnData(url:URL,completionHandler: @escaping (Data?) -> Void){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil)
                return
            }
            completionHandler(data)
            
        }
        task.resume()
    }
}
