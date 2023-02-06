//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/03.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    
    let dataController = DataController()
    @StateObject var viewModel = UserViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(viewModel)
                
        }
    }
}
