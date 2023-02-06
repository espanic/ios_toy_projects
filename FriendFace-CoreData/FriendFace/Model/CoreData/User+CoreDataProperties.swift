//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by 최윤호 on 2023/02/04.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var isActive: Bool
    @NSManaged public var id: UUID
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    
    public var wrappedName : String {
        name ?? "Unknwon name"
    }
    
    public var wrappedCompany : String {
        company ?? "Unknwon compancy"
    }
    
    public var wrappedEmail : String {
        email ?? "Unknown email"
    }
    
    public var wrappedAdress : String {
        address ?? "Unknwon address"
    }
    
    public var wrappedAbout : String {
        about ?? "No Information"
    }
    
    public var wrappedRegistered : Date{
        registered ?? Date.now
    }
    
    
    
    public var friendsArray : [User] {
        let set = friends as? Set<User> ?? []
        return set.sorted {$0.wrappedName < $1.wrappedName}
    }
    

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: User)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: User)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension User : Identifiable {
    
    
     convenience init(context moc: NSManagedObjectContext, jsonUser : JsonUser){
        self.init(context: moc)
         self.id = jsonUser.id
         self.name = jsonUser.name
         self.age = Int16(jsonUser.age)
         self.company = jsonUser.company
         self.about = jsonUser.about
         self.address = jsonUser.address
         self.email = jsonUser.email
         self.registered = jsonUser.registered
         self.isActive = jsonUser.isActive
         
    }
}

