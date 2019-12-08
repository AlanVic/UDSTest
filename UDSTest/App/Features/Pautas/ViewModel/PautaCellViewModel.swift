//
//  PautaCellViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

class PautaCellViewModel: Equatable {
    static func == (lhs: PautaCellViewModel, rhs: PautaCellViewModel) -> Bool {
        return lhs == rhs
    }
    
    public let pauta: Pauta?
    public var isExpanded: Bool
    
    init(_ pauta: Pauta) {
        self.pauta = pauta
        self.isExpanded = false
    }
    
}
