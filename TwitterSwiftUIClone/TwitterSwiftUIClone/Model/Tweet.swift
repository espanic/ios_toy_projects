//
//  Tweet.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/11.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet : Identifiable, Decodable {
    @DocumentID var id : String?
    let caption : String
    let timestamp : Timestamp
    let uid : String
    var likes : Int
    
    var user : User?
    var didLike : Bool? = false
}
