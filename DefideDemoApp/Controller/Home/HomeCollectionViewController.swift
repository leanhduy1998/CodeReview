//
//  HomeCollectionViewController.swift
//  DefideDemoApp
//
//  Created by Duy Le 2 on 10/11/18.
//  Copyright © 2018 Duy Le 2. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeCollectionViewCell"

class HomeCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    private var uiController:HomeUIController!
    private var controller:HomeController!
    
    private var selectedPhoto:Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchImages()
    }
    
    private func fetchImages(){
        controller.fetchImages(tumblrBlogName: "kitty") { [weak self] (uiState) in
            self!.uiController.uiState = uiState
        }
    }
    
    private func setup(){
        uiController = HomeUIController(viewcontroller: self)
        controller = HomeController()
    }

    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return controller.tumblrPhotos.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeCollectionViewCell
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as? HomeCollectionViewCell
        cell!.photoViewModel = PhotoViewModel(photo: controller.tumblrPhotos[indexPath.section])
    }

 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto = controller.tumblrPhotos[indexPath.section]
        performSegue(withIdentifier: "HomeToDetailSegue", sender: self)
    }
    
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            destination.photo = selectedPhoto
        }
     }
}
