//
//  AuthResponse.swift
//  Spotify
//
//  Created by 최윤호 on 2023/03/25.
//

import Foundation

struct AuthResponse : Codable {
    let access_token : String
    let expires_in : Int
    let refresh_token : String?
    let scope : String
    let token_type : String
}


