//
//  Movie_Model.swift
//  Movies App
//
//  Created by John Alfy on 1/10/22.
//

import Foundation

struct MovieModel: Codable {
    let title, genre, plot, imdbRating: String?
    let images: [String]?
    var loved : Bool = false
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case genre = "Genre"
        case plot = "Plot"
        case imdbRating
        case images = "Images"
    }
}

typealias Movies = [MovieModel]
