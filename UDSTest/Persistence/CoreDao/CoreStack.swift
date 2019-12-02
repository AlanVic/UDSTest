//
//  CoreStack.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import CoreData

public class CoreStack {
    
    let nameContainer: String!
    
    public init(with nameContainer: String) {
        self.nameContainer = nameContainer
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.nameContainer)
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let err = error {
                fatalError()
            }
        })
        return container
    }()
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError()
            }
            
        }
        
    }
    
}
