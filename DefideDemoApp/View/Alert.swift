//
//  Alert.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/12/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    private weak var viewcontroller:UIViewController!
    private var alert: UIAlertController!
    
    init(viewcontroller:UIViewController,title:String,message:String){
        self.viewcontroller = viewcontroller
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [weak self] (_) in
            self?.alert.dismiss(animated: true, completion: nil)
        }))
    }
    
    init(viewcontroller:UIViewController){
        self.viewcontroller = viewcontroller
        alert = UIAlertController(title: "Lỗi", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [weak self] (_) in
            self?.alert.dismiss(animated: true, completion: nil)
        }))
    }
    
    func updateTitleAndMessage(title:String,message:String){
        alert.title = title
        alert.message = message
    }
    
    // for Unit Test
    func getTitle()->String{
        return alert!.title!
    }
    
    func show(){
        DispatchQueue.main.async { [weak self]  in
            self!.viewcontroller.present(self!.alert, animated: true, completion: nil)
        }
    }
}
