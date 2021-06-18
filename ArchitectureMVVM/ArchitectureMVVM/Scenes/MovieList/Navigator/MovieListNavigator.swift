//
//  MovieListNavigator.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import Foundation
import SwiftUI
import Adapter

final class MovieListNavigator : Navigator {
    
    enum Destination: DestinationProtocol
    {
        case movieDetailView(Movie)
        
        var view: some View
        {
            switch self {
            case .movieDetailView(let movie):
                MovieDetailView(movie: movie)
            }
        }
    }
    
    @ViewBuilder
    func bind(_ destination: Destination, with trigger: Binding<Bool>, isPresent: Bool = false) -> some View {
        if isPresent
        {
            EmptyView().sheet(isPresented: trigger) {
                destination.view
            }
        }
        else
        {
            NavigationLink(destination: destination.view, isActive: trigger) {
                EmptyView()
            }
        }
    }

}
