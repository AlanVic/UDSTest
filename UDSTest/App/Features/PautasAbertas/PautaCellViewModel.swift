//
//  PautaCellViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

struct PautaCellViewModel{
    public let pauta: Pauta?
    
    init(_ pauta: Pauta) {
        self.pauta = pauta
    }
}
