//
//  HomeController.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation

class HomeController{
    var tumblrPhotos = [Photo]()
    
    func fetchImages(tumblrBlogName:String,completionHandler: @escaping (_ result:UIState) -> Void){
        
        let urlString = "https://api.tumblr.com/v2/blog/\(tumblrBlogName).tumblr.com/posts/photo?api_key=\(Constant.apiKey)"
        
        guard let url = URL(string: urlString) else{
            completionHandler(.Failed("Sai định dạng URL"))
            return
        }
        
        Network.sendGETRequestReturnJSON(url: url) { [weak self] (json) in
            if(json == nil){
                completionHandler(.Failed("Không thể load địa chỉ Tumblr này!"))
                return
            }
            if(!self!.requestSuccess(json: json!)){
                completionHandler(.Failed("Không thể load địa chỉ Tumblr này!"))
                return
            }
            
            let urls = self!.getUrlsPhotosJSON(json: json!)
            
            for url in urls{
                self!.tumblrPhotos.append(Photo(url: url))
            }
            
            completionHandler(.Success())
        }
        
    }
    
    private func requestSuccess(json:[String:Any])->Bool{
        guard let meta = json["meta"] as? [String:Any] else {
            fatalError("meta in JSON not found")
        }
        guard let status = meta["status"] as? Int else{
            fatalError("status in meta in JSON not found")
        }
        if(status != 200){
            return false
        }
        return true
    }
    
    private func getUrlsPhotosJSON(json:[String:Any]) -> [String]{
        guard let response = json["response"] as? [String:Any] else{
            fatalError("response in JSON not found")
        }
        
        guard let posts = response["posts"] as? [[String:Any]] else{
            fatalError("response/posts in JSON not found")
        }
        
        var urls = [String]()
        
        for post in posts{
            // this dictionary holds the same image of different sizes
            guard let photos = post["photos"] as? [[String:Any]] else{
                fatalError("response/posts/{post}/photos in JSON not found")
            }
            
            let photo = photos[0]
            
            guard let altPhotos = photo["alt_sizes"] as? [[String:Any]] else{
                fatalError("response/posts/{post}/photos/alt_sizes in JSON not found")
            }
            
            for alteredPhoto in altPhotos{
                guard let width = alteredPhoto["width"] as? Int else{
                    fatalError("response/posts/{post}/photos/alt_sizes/{altered photo}/width in JSON not found")
                }
                
                guard let height = alteredPhoto["height"] as? Int else{
                    fatalError("response/posts/{post}/photos/alt_sizes/{altered photo}/width in JSON not found")
                }
                
                if(height == width && height == 500){
                    guard let urlString = alteredPhoto["url"] as? String else{
                        fatalError("response/posts/{post}/photos/alt_sizes/{altered photo}/url in JSON not found")
                    }
                    urls.append(urlString)
                }
            }
        }
        
        return urls
    }
}
