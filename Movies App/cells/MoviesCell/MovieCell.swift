//
//  TableViewCell.swift
//  Movies App
//
//  Created by John Alfy on 1/5/22.
//

import UIKit
import Kingfisher
class TableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var lovedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    public func initializer(movie : MovieModel){
        titleName.text = movie.title
        descriptionLabel.text = movie.plot
        ratingLabel.text = "⭐️ \(movie.imdbRating!)"
        categoriesLabel.text = movie.genre
        lovedLabel.isHidden = !movie.loved
        let url = URL(string:"\(movie.images![0])" )
        movieImageView.kf.setImage(with: url)
        
    }

   func setUpUI(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        movieImageView.layer.borderWidth = 1
        movieImageView.layer.masksToBounds = false
        movieImageView.layer.borderColor = UIColor.black.cgColor
        movieImageView.layer.cornerRadius = movieImageView.frame.height/2
        movieImageView.clipsToBounds = true
    }
    
}
