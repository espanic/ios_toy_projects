//
//  FeedViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/11.
//

import Foundation

class FeedViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweets { tweets in
            self.tweets = tweets
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(withUid: uid) { user in
                    print("fetch user from feedview")
                    self.tweets[i].user = user
                }
            }
            
        }
    }
}
