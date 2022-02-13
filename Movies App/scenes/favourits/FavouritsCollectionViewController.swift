//
//  FavouritsCollectionViewController.swift
//  Movies App
//
//  Created by John Alfy on 2/12/22.
//

import UIKit

private let reuseIdentifier = "FavouritsCell"

class FavouritsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favouritMovies = MoviesDataSource.movies.filter({$0.loved})
        collectionView.reloadData()
    }
    
    var favouritMovies : [MovieModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Favourits"
//        self.collectionView!.register(FavouritsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        favouritMovies = MoviesDataSource.movies.filter({$0.loved})
        dump(favouritMovies)
        collectionView.reloadData()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return favouritMovies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavouritsCollectionViewCell
     
        cell.initialzer(movie: favouritMovies[indexPath.row])
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = favouritMovies[indexPath.row]
        let vc = DetailedViewController.initialize(movie: selectedMovie, viewModel: DetailedViewModel())
    
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side: CGFloat = (collectionView.frame.width - 40) / 2
        return .init(width: side, height: side)
    }

}
