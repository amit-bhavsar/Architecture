//
//  ABTextField.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 14/11/19.
//  Copyright © 2019 MAC104. All rights reserved.
//

import SwiftUI

struct ABTextField: View {
    
    var placeHolder: String = ""
    var captionValue: String = ""
    @Binding var text: String
    var onEditEnd : () -> String? = { return nil }
    @State private var error: String? = nil
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5)
        {
            Text(captionValue).font(.subheadline).foregroundColor((error == nil) ? Color.black : Color.red)
            
            TextField(placeHolder, text: $text, onEditingChanged: { (isChanged) in
                if isChanged == false
                {
                    self.error = self.onEditEnd()
                }
            }) 
            
            Divider()
                .background((error == nil) ? Color.black : Color.red)
            
            if error != nil
            {
                Text(error!).font(.footnote).foregroundColor(Color.red)
            }
            
        
        }
        
        
    }
}

struct ABTextField_Previews: PreviewProvider {
    static var previews: some View {
        ABTextField(placeHolder: "Email", captionValue: "Email", text: .constant(""))
    }
}
