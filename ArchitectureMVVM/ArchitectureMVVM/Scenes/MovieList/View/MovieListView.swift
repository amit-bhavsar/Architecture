//
//  MovieListView.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import SwiftUI
import Adapter

struct MovieListView: View, Adapter {
    @ObservedObject var viewModel: MovieListViewModel
    
    init() {
        viewModel = MovieListViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            List(viewModel.movies) { movie in
                MovieRowView(movie: movie)
                    .navigate(MovieListNavigator.Destination.movieDetailView(movie))
            }
            
            .navigationBarTitle("Movies")
            .navigationBarItems(leading:
                                    Button("Load") {
                                        viewModel.callAPI()
                                    }.foregroundColor(.green))
            //.navigationBarHidden(true)
        }.indicator(state: $viewModel.state)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
