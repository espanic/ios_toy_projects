//
//  User.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/03.
//

import Foundation

class ObserableUser : ObservableObject {
    
    @Published var data : UserData
    @Published var friends = [ObserableUser]()
    
    init(user: UserData) {
        self.data = user
    }
    
}



struct UserData : Codable {
    let id : String
    let isActive : Bool
    let name : String
    let age : Int
    let company : String
    let email : String
    let address : String
    let about : String
//    let registered : Date
    let tags : [String]
    let friends : [Friend]
    
    struct Friend : Codable {
        let id : String
        let name : String
        
    }
    
}
