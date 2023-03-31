//
//  SearchBar.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/10.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
            .padding(8)
            .padding(.horizontal, 24)
            .background(Color(.systemGray6))
            .overlay {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            }
            
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}

