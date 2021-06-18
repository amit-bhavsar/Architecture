//
//  MovieDetailViewModel.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import UIKit
import Foundation
import Combine
import SwiftUI

final class MovieDetailViewModel: ViewModelProtocol {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    
}

