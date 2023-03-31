//
//  ProfileView.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/22.
//

import SwiftUI
import Kingfisher
struct ProfileView: View {
    @State private var selectionFilter : TweetFilterViewModel = .tweets
    @ObservedObject var viewModel : ProfileViewModel
    @Namespace var animation
    @Environment(\.dismiss) private var dismiss
    
    init(user : User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(username: "batman", fullname: "Bruce Wayne", profileImageUrl: "", email: "batmal@gmail.com"))
    }
}


extension ProfileView {
    var headerView : some View{
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button {
                    print("back")
                    dismiss()
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y : -4)
                }
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
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
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@\(viewModel.user.username)")
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
            
            
            UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar : some View{
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
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut){
                        self.selectionFilter = item
                        viewModel.updateTweets(forFilter: self.selectionFilter)
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y : 16))
    }
    
    var tweetsView : some View{
        ScrollView{
            LazyVStack {
                ForEach(viewModel.tweets(forFilter: self.selectionFilter), id: \.id){tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
    
}
