//
//  FavouritsCollectionViewCell.swift
//  Movies App
//
//  Created by John Alfy on 2/12/22.
//

import UIKit
import Kingfisher
class FavouritsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var movieName : UILabel!
    
    private var model: MovieModel?

    override class func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func initialzer(movie : MovieModel){
        movieName.text = movie.title
        let url = URL(string:"\(movie.images![0])" )
        image.kf.setImage(with: url)    }
}
