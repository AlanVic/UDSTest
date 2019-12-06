//
//  Pautas.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

struct Pautas {
    var title: String
    var shortDescription: String
    var description: String
    
    var dictionary: [String: Any] {
        return [
            "title": title,
            "shortDescription": shortDescription,
            "description": description
        ]
    }
}

extension Pautas {
    init?(dictionary: [String: Any], id: String) {
        guard let title = dictionary["title"] as? String,
            let shortDescription = dictionary["shortDescription"] as? String,
            let description = dictionary["description"] as? String
            else { return nil }
        
        self.init(title: title, shortDescription: shortDescription, description: description)
    }
}
