//
//  CoreStack.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import CoreData

public class CoreDao<Element: NSManagedObject>: ConfigurableDao {
    
    public var context: NSManagedObjectContext
    
    init(with containerName: String) {
        let coreStack = CoreStack(with: containerName)
        context = coreStack.persistentContainer.viewContext
    }
    
    public func new() -> Element {
        return NSEntityDescription.insertNewObject(forEntityName: Element.className, into: context) as! Element
    }
    
    public func insert(object: Element) {
        context.insert(object)
        save()
    }
    
    public func fetchAll() -> [Element] {
        let request = NSFetchRequest<Element>(entityName: Element.className)
        let result = try! context.fetch(request)
        return result
    }
    
    public func delete(object: Element) {
        context.delete(object)
        save()
    }
    
    public func save() {
        do {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
