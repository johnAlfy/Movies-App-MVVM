//
//  MainTabBarController.swift
//  Movies App
//
//  Created by John Alfy on 1/22/22.
//

import UIKit

class MainTabBarController: UITabBarController ,UITabBarControllerDelegate{
    
   var favouritMovies : [MovieModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Favourits"{
            print("here")
            let storyboard = UIStoryboard(name:"FavouritsCollectionView", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FavouritsCollectionView") as! FavouritsCollectionView
            vc.favouritMovies = self.favouritMovies
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
