//
//  ViewModel.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 14/06/21.
//

import Foundation

enum ViewState {
    case none
    case loading
    case failure(Error)
    case success
}


protocol ViewModel: ObservableObject
{
    init()
}

protocol Navigable
{
    associatedtype Navigator
    associatedtype Destination
    var navigator: Navigator { get set }
    func onNext(destination: Destination)
}

protocol API
{
    associatedtype Interactor
    var interactor: Interactor { get set }
    func callAPI()
}

protocol StateFul
{
    associatedtype ViewState
    var state: ViewState { get set }
}

/*
final class TestViewModel : ViewModel, StateFul, Navigable, API
{
    @Published var state: ViewState = .none
    var navigator: MovieListNavigator
    var interactor: MovieListInteractor
    
    init() {
        navigator = MovieListNavigator()
        interactor = MovieListInteractor()
    }
    
    func onNext(destination: MovieListNavigator.Destination) {
        
    }
    
    func callAPI() {
        
    }
}
*/
