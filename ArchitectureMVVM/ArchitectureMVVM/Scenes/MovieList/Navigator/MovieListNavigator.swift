//
//  MovieListNavigator.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import Foundation
import SwiftUI

final class MovieListNavigator : Navigator {
    
    enum Destination: DestinationProtocol
    {
        case contentView(String)
        
        var view: some View
        {
            switch self {
            case .contentView(let string):
                ContentView(string: string)
            }
        }
        
    }
    
    @ViewBuilder
    func bind(_ destination: Destination, with trigger: Binding<Bool>, isPresent: Bool = false) -> some View {
        if isPresent
        {
            EmptyView().fullScreenCover(isPresented: trigger) {
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
