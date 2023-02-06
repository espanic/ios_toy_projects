//
//  UserViewModel.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/03.
//
import Foundation
import CoreData
import SwiftUI
class UserViewModel : ObservableObject  {
//    @Published var users  = [User]()
//    @FetchRequest(sortDescriptors: []) var users : FetchedResults<User>

    
    
    
    func loadUsers(url : URL?, moc : NSManagedObjectContext) async {
        await DataInitializer.loadJsonData(url: url, moc: moc)
    }

    
}
