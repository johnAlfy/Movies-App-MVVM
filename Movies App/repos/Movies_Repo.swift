//
//  Movies_Repo.swift
//  Movies App
//
//  Created by John Alfy on 1/12/22.
//

import Foundation
import Moya
// MARK: make a repo protocol
class MoviesRepo {
    
    let moviesProvider = MoyaProvider<MoviesServices>()
    
    func getMovies( doAfterReturn :  @escaping ([MovieModel]) -> ()  ) {
        moviesProvider.request(.getMovies) {
            (result) in
            switch result {
            case .success(let response) :
              let movies =  self.parseResponse(response: response)
                doAfterReturn(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseResponse(response : Response) -> [MovieModel] {
        let movies = try? JSONDecoder().decode([MovieModel].self, from: response.data)
        return movies ?? []
    }
}
