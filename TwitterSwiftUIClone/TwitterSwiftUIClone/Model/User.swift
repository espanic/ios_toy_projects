//
//  User.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/08.
//

import FirebaseFirestoreSwift
struct User : Identifiable, Codable {
    @DocumentID var id: String?
    let username : String
    let fullname : String
    let profileImageUrl : String
    let email : String
}
