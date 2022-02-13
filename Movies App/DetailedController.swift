//
//  DetailedController.swift
//  Movies App
//
//  Created by John Alfy on 1/10/22.
//

import UIKit

class DetailedController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    
    
    public func initializer(movie : MovieModel){
        self.movieTitle?.text = movie.title!
        self.movieDescription?.text = movie.plot!
        self.movieRate?.text = "⭐️ \(movie.imdbRating!)"
        self.movieCategory?.text = movie.genre!
        let url = URL(string:"\(movie.images![0])" )
        self.movieImage?.kf.setImage(with: url)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
