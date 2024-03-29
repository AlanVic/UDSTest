//
//  ConfigurableDAO.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

protocol ConfigurableDao {
    associatedtype Object
    func insert(object: Object)
    func delete(object: Object)
    func fetchAll() -> [Object]
}
