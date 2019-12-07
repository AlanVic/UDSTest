//
//  PautasAbertasViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation
import Firebase

struct PautasAbertasViewModel {
    
    private var colRef: CollectionReference!
    private var pautas: [Pauta] = []
    
    init() {
        colRef = Firestore.firestore().collection("Pautas")
    }
    
    func numberOfRows() -> Int {
        return 0
    }
    
    func getPautas(completion: @escaping () -> Void) {
        colRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
}
