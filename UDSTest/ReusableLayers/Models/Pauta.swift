//
//  Pautas.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

struct Pauta {
    var title: String
    var shortDescription: String
    var description: String
    var author: String
    var status: String
    var uuid: String
    
    var dictionary: [String: Any] {
        return [
            "title": title,
            "shortDescription": shortDescription,
            "description": description,
            "author": author,
            "status": status,
            "uuid" : uuid
        ]
    }
}

extension Pauta {
    init(){
        title = ""
        shortDescription = ""
        description = ""
        author = ""
        status = TypePautas.open.rawValue
        uuid = UUID().uuidString
    }
    
    init?(dictionary: [String: Any], id: String) {
        guard let title = dictionary["title"] as? String,
            let shortDescription = dictionary["shortDescription"] as? String,
            let description = dictionary["description"] as? String,
            let author = dictionary["author"] as? String,
            let status = dictionary["status"] as? String,
            let uuid = dictionary["uuid"] as? String
            else { return nil }
        
        self.init(title: title, shortDescription: shortDescription, description: description, author: author, status: status, uuid: uuid)
    }
}
