//
//  UserRowView.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/25.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4){
                Text("joker")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("heath Ledger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
