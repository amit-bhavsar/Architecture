//
//  ABButton.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 14/11/19.
//  Copyright © 2019 MAC104. All rights reserved.
//

import SwiftUI

struct ABButton: View {
    
    var text: String
    var disable: Bool = false
    var backgroundColor: Color = Color.clear
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .font(.headline)
                    .foregroundColor(disable ? Color.black.opacity(0.5) : Color.black)
                    
                .padding()
                Spacer()
                    
            }
            .background(disable ? backgroundColor.opacity(0.5) : backgroundColor)
        }
    }
}

struct ABButton_Previews: PreviewProvider {
    static var previews: some View {
        ABButton(text: "Login", disable: true) {
            print("Tapped")
        }
    }
}
