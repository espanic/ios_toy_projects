//
//  TwitterSwiftUICloneApp.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/01/22.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUICloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    
            }
            .environmentObject(viewModel)
            
        }
    }
}
