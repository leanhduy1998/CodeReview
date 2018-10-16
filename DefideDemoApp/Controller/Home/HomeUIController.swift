//
//  HomeUIController.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import Foundation
import UIKit

class HomeUIController{
    private weak var viewcontroller:HomeCollectionViewController!
    private var errorAlert:Alert!
    
    init(viewcontroller:HomeCollectionViewController){
        self.viewcontroller = viewcontroller
        errorAlert = Alert(viewcontroller: viewcontroller)
        setupCollectionViewFlowLayout()
    }
    
    var uiState:UIState = .Loading(){
        willSet(newState){
            updateUIState(newState: newState)
        }
    }
    
    private func updateUIState(newState:UIState){
        switch(uiState,newState){
        case (.Loading(), .Success()):
            DispatchQueue.main.async { [weak self] in
                self!.viewcontroller.collectionView.reloadData()
            }
            break
        case (.Success(),.Success()):
            DispatchQueue.main.async { [weak self] in
                self!.viewcontroller.collectionView.reloadData()
            }
            break
        case (.Failed(_),.Success()):
            DispatchQueue.main.async { [weak self] in
                self!.viewcontroller.collectionView.reloadData()
            }
            break
        
            
        case (.Failed(_),.Failed(let errorMsg)):
            errorAlert.updateTitleAndMessage(title: "Lỗi Load Hình Ảnh", message: errorMsg)
            errorAlert.show()
            break
        case (.Success(),.Failed(let errorMsg)):
            errorAlert.updateTitleAndMessage(title: "Lỗi Load Hình Ảnh", message: errorMsg)
            errorAlert.show()
            break
        case (.Loading(),.Failed(let errorMsg)):
            errorAlert.updateTitleAndMessage(title: "Lỗi Load Hình Ảnh", message: errorMsg)
            errorAlert.show()
            break
            
        case (.Success(),.Loading()):
            break
        case (.Loading(),.Loading()):
            break
        case (.Failed(_),.Loading()):
            break
        
            
        default:
            fatalError("uiState conditions not set")
        }
    }
    
    private func setupCollectionViewFlowLayout(){
        let flowLayout = viewcontroller.flowLayout!
        let screenWidth = viewcontroller.view.frame.width
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        // the image size is 500x500, so it is a square
        flowLayout.itemSize = CGSize(width: screenWidth, height: screenWidth)
    }
}
