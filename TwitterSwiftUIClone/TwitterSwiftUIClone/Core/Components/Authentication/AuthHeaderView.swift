//
//  AuthenticationHeader.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/31.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1 : String
    let title2 : String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
            }
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

struct AuthHeaderPrievew_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome back")
    }
}
