//
//  User+CoreDataProperties.swift
//  
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var username: String?
    @NSManaged public var pautas: NSSet?

}

// MARK: Generated accessors for pautas
extension User {

    @objc(addPautasObject:)
    @NSManaged public func addToPautas(_ value: Pauta)

    @objc(removePautasObject:)
    @NSManaged public func removeFromPautas(_ value: Pauta)

    @objc(addPautas:)
    @NSManaged public func addToPautas(_ values: NSSet)

    @objc(removePautas:)
    @NSManaged public func removeFromPautas(_ values: NSSet)

}
