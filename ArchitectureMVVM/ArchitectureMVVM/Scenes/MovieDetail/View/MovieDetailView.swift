//
//  MovieDetailView.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import SwiftUI
import Adapter

struct MovieDetailView: View, Adapter {
    
    @Environment(\.presentationMode) var presentation
    
    var viewModel: MovieDetailViewModel
    
    init(movie: Movie) {
        viewModel = MovieDetailViewModel(movie: movie)
    }
    
    var body: some View {
        
        VStack {
            MovieRowView(movie: viewModel.movie).navigate(ContentView(string: viewModel.movie.title))
            
        }
        .navigationBarTitle(viewModel.movie.id)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button("Back") {
                                    self.presentation.wrappedValue.dismiss()
                                }.foregroundColor(.green))
        
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
