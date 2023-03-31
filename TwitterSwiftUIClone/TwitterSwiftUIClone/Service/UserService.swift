//
//  UserService.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/08.
//

import Firebase
import FirebaseFirestoreSwift
struct UserService {
    func fetchUser(withUid uid : String, completion: @escaping(User) -> Void) {
        print("DEBUG: Fetch user info..")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                guard let user : User  = try? snapshot.data(as: User.self) else {return}
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let users = documents.compactMap {try? $0.data(as: User.self)}
                completion(users)
            }
    }
}
