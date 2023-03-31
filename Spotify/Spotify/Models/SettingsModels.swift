//
//  SettingsModels.swift
//  Spotify
//
//  Created by 최윤호 on 2023/03/27.
//

import Foundation

struct Section {
    let title : String
    let options : [Option]
}

struct Option {
    let title : String
    let handler : ()->Void
}
