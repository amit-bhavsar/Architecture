//
//  MovieListView.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    init() {
        viewModel = MovieListViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            List(viewModel.movies) { movie in
                MovieRowView(movie: movie)
                    .navigate(MovieListNavigator.Destination.contentView(movie.title))
            }
            
            .navigationBarTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Load") {
                    viewModel.callAPI()
                }
            }
            //.navigationBarHidden(true)
        }.indicator(state: $viewModel.state)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
