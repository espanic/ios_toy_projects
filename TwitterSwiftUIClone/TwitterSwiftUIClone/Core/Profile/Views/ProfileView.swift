//
//  ProfileView.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectionFilter : TweetFilterViewModel = .tweets
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            
            HStack{
                ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
                    VStack{
                        Text(item.title)
                            .font(.subheadline)
                            .fontWeight(selectionFilter == item ? .semibold : .regular)
                            .foregroundColor(selectionFilter == item ? .black : .gray)
                        if selectionFilter == item {
                            Capsule()
                                .foregroundColor(Color(.systemBlue))
                                .frame(height: 3)
                                
                        }else {
                            Capsule()
                                .foregroundColor(.clear)
                                .frame(height: 3)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.easeOut){
                            self.selectionFilter = item
                        }
                    }
                }
            }
            
            
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView {
    var headerView : some View{
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button {
                    
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y : 12)
                }
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y : 24)
            }
        }
        .frame(height : 96)
    }
    
    var actionButtons : some View {
        HStack(spacing : 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button{}label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails : some View {
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text("Heath Ledger")
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                
                HStack{
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
            HStack(spacing: 24) {
                HStack {
                    Text("807").font(.subheadline).bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("6.9M").font(.subheadline).bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}
