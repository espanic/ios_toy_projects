//
//  UploadTweetViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/10.
//

import Foundation

class UploadTweetViewModel : ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    func uploadTweet(caption : String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            }else{
                // show error messages to user
            }
        }
    }
}
