//
//  DetailedViewController.swift
//  Movies App
//
//  Created by John Alfy on 1/10/22.
//

import UIKit
 
class DetailedViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak private var movieImage: UIImageView!
    @IBOutlet weak private var movieTitle: UILabel!
    @IBOutlet weak private var movieRate: UILabel!
    @IBOutlet weak private var movieDescription: UILabel!
    @IBOutlet weak private var movieCategories: UILabel!
    @IBOutlet weak private var likeButton: UIButton!
    
    //MARK: Stored properties
    var viewModel : DetailedViewModel!
    var movie : MovieModel!
    // var reflectLoveToOutCellDelegate : reflectLoveToOutCellDelegate!
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializer()
        setIfLiked()
        
    }
    static func initialize(movie: MovieModel, viewModel: DetailedViewModel) -> Self {
        let vc = UIStoryboard(name: "DetailedStoryBoard", bundle: nil).instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
        vc.movie = movie
        vc.viewModel = viewModel
        return vc
    }
    
    private func initializer() {
        self.movieTitle?.text = movie.title
        self.movieDescription?.text = movie.plot
        self.movieRate?.text = "⭐️ \(movie.imdbRating!)"
        self.movieCategories?.text = movie.genre
        let url = URL(string:"\(movie.images![0])" )
        self.movieImage?.kf.setImage(with: url)
        likeButton.layer.cornerRadius = likeButton.frame.height / 2
    }
    
    private func setIfLiked() {
        if let movieLiked = AppCache.shared.getBool(key: movie.title!){
            if movieLiked {
                likeButton.setTitle("❤️", for: .normal)
            }
        }
    }
// MARK: 
  
    @IBAction func pressLove(_ sender: Any) {
            pressLike()
    }
    
   func pressLike() {
       if (likeButton.titleLabel?.text == "🤍") {
           likeButton.setTitle("❤️", for: .normal)
           AppCache.shared.setBool(key: movie.title!, bool: true)
          
       } else {
           likeButton.setTitle("🤍", for: .normal)
           AppCache.shared.setBool(key: movie.title!, bool: false)
       }
       viewModel.didTapOnLoveSubject.onNext(())
      // moviesViewModel.reflectLove(movieName: movie.title!)
    }
}



