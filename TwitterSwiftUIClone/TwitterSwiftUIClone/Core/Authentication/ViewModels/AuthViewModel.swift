//
//  AuthViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/31.
//

import Firebase
import SwiftUI

class AuthViewModel : ObservableObject {
    @Published var userSession : Firebase.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser : User?
    private var tempUserSession : Firebase.User?
    private let service = UserService()
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()    
        
    }
    
    func login(withEmail email : String, password : String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG FAILED to sign in with error \(error.localizedDescription)")
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
            print("DEBUG : DId log user in..")
        }
    }
    
    func register(withEmail email : String, password : String, fullname : String, username : String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG FAILED to register with error \(error.localizedDescription)")
            }
            
            guard let user = result?.user else {return}
//            self.userSession = user
            self.tempUserSession = user
            
            
            let data = ["email" : email, "username" : username.lowercased(), "fullname" : fullname, "uid" : user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    self.didAuthenticateUser = true
                    if let error = error {
                        print("DEBUG : Error happens in uploading user data : \(error.localizedDescription)")
                    }
                }
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
        
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl" : profileImageUrl], completion: { error in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
    
                })
        }
        
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else{return}
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }

}
