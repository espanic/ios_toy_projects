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
    private var tempUserSession : Firebase.User?
    init(){
        self.userSession = Auth.auth().currentUser
        print("DUBUG : User session is  \(String(describing: self.userSession?.uid))")
    }
    
    func login(withEmail email : String, password : String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG FAILED to sign in with error \(error.localizedDescription)")
            }
            guard let user = result?.user else {return}
            self.userSession = user
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
                    print(error?.localizedDescription)
                    print("user session has been changed \(self.userSession?.uid)")
                })
        }
        
    }
}
