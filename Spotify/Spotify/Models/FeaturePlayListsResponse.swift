//
//  FeaturePlayListsResponse.swift
//  Spotify
//
//  Created by 최윤호 on 2023/03/30.
//

import Foundation

struct FeaturePlayListResponse : Codable {
    let playlists : PlaylistResponse
}

struct PlaylistResponse : Codable {
    let items : [Playlist]
}



struct User : Codable {
    let display_name : String
    let external_urls : [String : String]
    let id : String
}
