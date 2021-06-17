//
//  MovieListViewModel.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import UIKit
import Foundation
import Combine
import SwiftUI

final class MovieListViewModel: ViewModel
{
    var navigator: MovieListNavigator
    var interactor: MovieListInteractor
    
    @Published var state: ViewModelState = .none
    @Published var movies: [Movie] = []
    
    @Published var pushNextView = false
    
    init() {
        navigator = MovieListNavigator()
        interactor = MovieListInteractor()
    }
    
    func onNext(destination: MovieListNavigator.Destination) {
        
    }
    
    func callAPI() {
        state = .loading
        interactor.getMovies { result in
            switch result {
            case .failure(let error):
                print("Request failed due to: \(error)")
                self.state = .failure(error)
            case .success(let data):
                print("Request finished. \(data)")
                self.state = .success
                self.movies = data
            }
        }
    }
}
