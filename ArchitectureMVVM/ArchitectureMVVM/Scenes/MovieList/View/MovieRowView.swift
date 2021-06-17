//
//  MovieRowView.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import SwiftUI
import Kingfisher

struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: movie.avatar ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(movie.title).bold()
                Text("Rating : \(movie.rating)")
                Text(movie.createdAt ?? "-")
            }
            
        }
        
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie(id: "", title: "Test Name", avatar: "", rating: 5, createdAt: ""))
    }
}
