//
//  ViewController.swift
//  Movies App
//
//  Created by John Alfy on 1/3/22.
//

import UIKit
import RxSwift

class MoviesViewController: UIViewController , UISearchBarDelegate {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var moviesViewModel = MoviesViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibCellForTableView()
        getMovies()
        subscribeAndUpdateUI()
    }
    
    func getMovies(){
        spinner.startAnimating()
        moviesViewModel.getMovies()
    }
    
    func subscribeAndUpdateUI(){
        moviesViewModel.loadedMovies.subscribe(onNext: {[weak self] movies in
            DispatchQueue.main.async {
                self?.navigationItem.title = "Movies"
                self?.searchBar.isHidden = false
                self?.moviesTableView.reloadData()
                self?.spinner.stopAnimating()
            }
        }).disposed(by: moviesViewModel.disposBag)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        moviesViewModel.search(searchText: searchText)
        moviesTableView.reloadData()
    }
    
}

// MARK: extintions for table view
extension MoviesViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.filteredMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier:"MovieCell",for: indexPath) as! TableViewCell
        
        if let movieLiked = AppCache.shared.getBool(key: moviesViewModel.filteredMovies[indexPath.row].title!){
            if movieLiked {
                moviesViewModel.filteredMovies[indexPath.row].loved = movieLiked
                MoviesDataSource.movies[indexPath.row].loved = movieLiked
            }
        }
        cell.initializer(movie: moviesViewModel.filteredMovies[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedMovie = moviesViewModel.filteredMovies[indexPath.row]
        let vc = DetailedViewController.initialize(movie: selectedMovie, viewModel: DetailedViewModel())
        
        vc.viewModel.didTapOnLoveSubject.subscribe(onNext: {
            self.moviesViewModel.reflectLove(movieName: selectedMovie.title!)
            self.moviesTableView.reloadData()
        }).disposed(by: disposeBag)

        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func  registerNibCellForTableView(){
        let cellNib = UINib(nibName: "MovieCell", bundle: nil)
        moviesTableView.register(cellNib, forCellReuseIdentifier: "MovieCell")
    }
}


