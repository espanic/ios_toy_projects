//
//  DataInitializer.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/04.
//
import CoreData
import Foundation

struct DataInitializer {
    @MainActor static func loadJsonData(url: URL?, moc : NSManagedObjectContext) async{
        await fetchData(url: url) { jsonUsers in
            var userArray = [User]()
            for jsonUser in jsonUsers {
                let user = User(context: moc)
                user.id = jsonUser.id
                user.name = jsonUser.name
                user.age = Int16(jsonUser.age)
                user.company = jsonUser.company
                user.about = jsonUser.about
                user.address = jsonUser.address
                user.email = jsonUser.email
                user.registered = jsonUser.registered
                user.isActive = jsonUser.isActive
                userArray.append(user)
            }
            for i in 0..<userArray.count{
                let jsonFriends = jsonUsers[i].friends
                let user = userArray[i]
                for friend in jsonFriends{
                    if let friend = userArray.first(where: {$0.id == friend.id}){
                        user.addToFriends(friend)
                    }
                }
            }
            do {
                try moc.save()
            }catch{
                print("Cannot save the data.")
            }
            
            
        }
    }
    
    
    static func fetchData(url: URL?, completion: @escaping ([JsonUser]) async -> ()) async {
        guard let url = url else{
            print("Invalid URL")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let jsonUsers = try decoder.decode([JsonUser].self, from: data)
            await completion(jsonUsers)
            
        }catch{
            print(error.localizedDescription)
            print("Error ocurred during fetching data from url.")
        }
    }
}
