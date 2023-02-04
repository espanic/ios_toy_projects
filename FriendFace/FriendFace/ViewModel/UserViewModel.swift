//
//  UserViewModel.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/03.
//
import Foundation
class UserViewModel : ObservableObject  {
    @Published var users  = [ObserableUser]()
    
    
    
    
    @MainActor func loadUsers(url : URL?) async {
        //        users = []
        
        guard let url = url else {
            print("DEBUG: Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let rawUserList = try JSONDecoder().decode([UserData].self, from: data)
            var tempUsers = [ObserableUser]()
            for rawUser in rawUserList {
                let obserableUser = ObserableUser(user: rawUser)
                tempUsers.append(obserableUser)
            }
            for user in tempUsers{
                for friendInfo in user.data.friends{
                    guard let friend  :ObserableUser = tempUsers.first(where: { $0.data.id == friendInfo.id})else{
                        fatalError("A friend with \(friendInfo.id) cannot be found.")
                    }
                    user.friends.append(friend)
                }
            }
            self.users = tempUsers
            print("DEBUG: Loading users complete")
        }catch{
            print(error.localizedDescription)
        }
        
        
        
//
//        let request = URLRequest(url: url)
//        let session = URLSession.shared.dataTaskPublisher(for: request)
//            .tryMap { output in
//                return output.data
//                }
//            .
//                do{
//                    print("DEBUG: Data received")
//                    let rawUserList = try JSONDecoder().decode([User].self, from: data)
//                    var tempUsers = [ObserableUser]()
//                    for rawUser in rawUserList {
//                        let obserableUser = ObserableUser(user: rawUser)
//                        tempUsers.append(obserableUser)
//                    }
//
//                    for user in tempUsers{
//                        for friendInfo in user.user.friends{
//                            guard let friend  :ObserableUser = tempUsers.first(where: { $0.user.id == friendInfo.id})else{
//                                fatalError("A friend with \(friendInfo.id) cannot be found.")
//                            }
//                            user.friends.append(friend)
//                        }
//                    }
//
//
//                    self.users = tempUsers
//                    print("Task Complete")
//                }catch{
//                    print("\(error.localizedDescription)")
//                }
//            }
        
    }
    
    
}
