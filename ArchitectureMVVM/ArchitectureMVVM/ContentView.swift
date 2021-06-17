//
//  ContentView.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import SwiftUI

struct ContentView: View {
    
    var string: String
    
    var body: some View {
        Text("Hello, world!== \(string)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(string: "Hi")
    }
}
