//
//  TweetRowView.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/22.
//

import SwiftUI
import Kingfisher
struct TweetRowView: View {
    @ObservedObject var viewModel : TweetRowViewModel
    
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // profile image + user.info + tweet
            if let user = viewModel.tweet.user{
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    // user info & tweet caption
                    VStack(alignment: .leading, spacing: 4){
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            //action button
            HStack{
                Button{
                    // action goes here..
                }label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button{
                    // action goes here..
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                
                Button{
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlikeTweet() :
                    viewModel.likeTweet()
                }label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                Spacer()
                
                Button{
                    // action goes here..
                }label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
            }
            .foregroundColor(.gray)
            .padding()
            Divider()
        }
        
        
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
