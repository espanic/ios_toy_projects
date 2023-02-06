//
//  DataController.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/04.
//

import CoreData
class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "User")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
