//
//  TextArea.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/28.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeHolder : String
    
    init(_ placeHolder: String, text: Binding<String>) {
        self._text = text
        self.placeHolder = placeHolder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            TextEditor(text: $text)
                .padding(4)
            if text.isEmpty{
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }

        }
    
    }
}

