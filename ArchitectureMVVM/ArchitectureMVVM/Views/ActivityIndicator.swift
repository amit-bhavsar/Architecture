//
//  ActivityIndicator.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import Foundation
import UIKit
import SwiftUI
import Adapter

struct ActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView<Content> : View where Content: View {
    @Binding var state: ViewState
    var content: () -> Content
    
    var isShowing: Bool {
        switch state {
        case .loading:
            return true
        default:
            return false
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
}


extension View
{
    func indicator(state: Binding<ViewState>) -> some View {
        LoadingView(state: state) {
            self
        }
    }
}
