//
//  ExploreViewModel.swift
//  TwitterSwiftUIClone
//
//  Created by 최윤호 on 2023/02/08.
//

import Foundation

class ExploreViewModel : ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    var searchableUsers : [User] {
        if searchText.isEmpty {
            return users
        }else{
            let lowercasedQuery = searchText.lowercased()
            return users.filter { user in
                user.username.lowercased().contains(lowercasedQuery) ||
                user.fullname.lowercased().contains(lowercasedQuery)
            }
        }
    }
    let service = UserService()
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
