//
//  MoviesViewModel.swift
//  Movies App
//
//  Created by John Alfy on 2/12/22.
//

import Foundation
import RxSwift

class MoviesViewModel {
    
    let disposBag = DisposeBag()
    
    private let moviesRepo = MoviesRepo()
    
    var filteredMovies = [MovieModel]()
    
    private let moviesSubject = PublishSubject<[MovieModel]>()
    let reflectLoveSubject = PublishSubject<Bool>()
    
    var loadedMovies : Observable<[MovieModel]> {
        return moviesSubject.asObserver()
    }
    
    var reflectedLove : Observable<Bool> {
        return reflectLoveSubject.asObserver()
    }
    
    func getMovies() {
        moviesRepo.getMovies { movies in
            self.filteredMovies = movies
            // MARK: - move to repo
            MoviesDataSource.movies = movies
            self.moviesSubject.onNext(movies)
        }
    }
    
    func search(searchText: String) {
        filteredMovies = []
        if (searchText == "") {
            filteredMovies = MoviesDataSource.movies
        } else {
            MoviesDataSource.movies.forEach {MovieModel in
                if(MovieModel.title!.lowercased().contains(searchText.lowercased())) {
                    filteredMovies.append(MovieModel)
                }
            }
        }
    }
    
    func reflectLove(movieName: String) {
       
        let index = filteredMovies.firstIndex { MovieModel in
            MovieModel.title == movieName
        }
        if let i = index  {
            print("Toggle: \(filteredMovies[i].loved)")
            filteredMovies[i].loved.toggle()
            MoviesDataSource.movies[i].loved.toggle()
            self.reflectLoveSubject.onNext(true)
            self.moviesSubject.onNext(MoviesDataSource.movies)
        }
    }
}
