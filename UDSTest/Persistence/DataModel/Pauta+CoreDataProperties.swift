//
//  Pauta+CoreDataProperties.swift
//  
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//
//

import Foundation
import CoreData


extension Pauta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pauta> {
        return NSFetchRequest<Pauta>(entityName: "Pauta")
    }

    @NSManaged public var title: NSObject?
    @NSManaged public var smallDescription: NSObject?
    @NSManaged public var datails: NSObject?
    @NSManaged public var author: User?

}
