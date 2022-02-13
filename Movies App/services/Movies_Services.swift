//
//  Movies_Services.swift
//  Movies App
//
//  Created by John Alfy on 1/10/22.
//

import Foundation
import Moya

enum MoviesServices {
    case getMovies
}

extension MoviesServices : TargetType {
    var baseURL: URL {
        return URL(string: "https://gist.githubusercontent.com/saniyusuf/406b843afdfb9c6a86e25753fe2761f4/raw/523c324c7fcc36efab8224f9ebb7556c09b69a14/Film.JSON")!
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
