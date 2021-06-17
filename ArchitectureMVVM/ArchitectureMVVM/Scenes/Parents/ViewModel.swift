//
//  ViewModel.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 14/06/21.
//

import Foundation

enum ViewModelState {
    case none
    case loading
    case failure(Error)
    case success
}


protocol ViewModel: ObservableObject
{
    associatedtype Navigator
    associatedtype Destination
    var navigator: Navigator { get set }
    init()
    func onNext(destination: Destination)
}

/*
final class TestViewModel : ViewModel
{
    init() {
        navigator = LandingNavigator()
    }
    
    var navigator: LandingNavigator
    
    func onNext(destination: LandingNavigator.Destination) {
        
    }
}
*/
