//
//  Pauta+CoreDataProperties.swift
//  
//
//  Created by Alan Victor Paulino de Oliveira on 02/12/19.
//
//

import Foundation
import CoreData


extension Pauta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pauta> {
        return NSFetchRequest<Pauta>(entityName: "Pauta")
    }

    @NSManaged public var title: String?
    @NSManaged public var smallDescription: String?
    @NSManaged public var details: String?
    @NSManaged public var author: User?

}
