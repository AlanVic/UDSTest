//
//  NSManagedObject+Extension.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import CoreData

extension NSManagedObject {
    static var className: String {
        return String(describing: self)
    }
}
