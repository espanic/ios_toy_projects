//
//  Artist.swift
//  Spotify
//
//  Created by 최윤호 on 2023/03/24.
//

import Foundation

struct Artist : Codable {
    let id : String
    let name : String
    let type : String
    let external_urls : [String : String]
}
