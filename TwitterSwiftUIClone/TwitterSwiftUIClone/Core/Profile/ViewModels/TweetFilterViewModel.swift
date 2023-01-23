//
//  TweetFilterViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/22.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable  {
    case tweets
    case replies
    case likes
    
    var title : String {
        switch self {
        case .tweets : return "Tweets"
        case .replies : return "Replies"
        case .likes : return "Likes"
        }
    }
}
