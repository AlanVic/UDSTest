//
//  PautasAbertasViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation
import Firebase

class PautasViewModel {
    
    private var colRef: CollectionReference!
    
    var pautas: [PautaCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateList?()
            }
        }
    }
    
    var typePautas: TypePautas
    
    var updateList: (() -> Void)?
    
    init(withTypePautas typePautas: TypePautas) {
        self.typePautas = typePautas
        colRef = Firestore.firestore().collection("Pautas")
    }
    
    func numberOfSections() -> Int {
        if self.pautas.count == 0 {
            fetchData()
        }
        return self.pautas.count
    }
    
    func fetchData() {
        self.getPautas(completion: {
            self.pautas = $0.map({ PautaCellViewModel($0) })
            self.updateList?()
        })
    }
    
    func cellViewModel(toSection section: Int) -> PautaCellViewModel {
        if pautas.count == 0 {
            return PautaCellViewModel(Pauta())
        }
        let pautaCell = pautas[section]
        return pautaCell
    }
    
    func changeStatus(atSection section:Int, completion: @escaping () -> Void) {
        let pautaCell = pautas[section]
        if let pauta = pautaCell.pauta, let status = TypePautas(rawValue: pauta.status) {
            updatePauta(pauta: pautaCell, withStatus: status) {
                completion()
            }
        }
    }
    
    func isExpanded(inSection section:Int) -> Bool {
       return pautas[section].isExpanded
    }
    
//    func collapsePautas(withoutSection section: Int) {
//        pautas.forEach { (pauta) in
//            let index = pautas.firstIndex { $0 == pauta }
//
//        }
//
//        for (index,pauta) in self.pautas.enumerated() {
//            if index == section{
//                return
//            }
//
//
//        }
//    }
    
    func indexPathIsExpanded() -> IndexPath? {
        let indexes = pautas.firstIndex { $0.isExpanded == true }
        guard let onlyIndex = indexes else { return nil }
        
        return IndexPath(row: 0, section: onlyIndex)
    }
    
    private func updatePauta(pauta: PautaCellViewModel, withStatus status: TypePautas, completion: @escaping () -> Void) {
        if let pauta = pauta.pauta {
            colRef.document(pauta.uuid).updateData(["status" : status.rawValue]) { (error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                   completion()
                }
            }
        }
    }
    
    private func getPautas(completion: @escaping ([Pauta]) -> Void) {
        colRef.whereField("status", isEqualTo: typePautas.rawValue).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                let pautas = querySnapshot!.documents.map({ Pauta(dictionary: $0.data(), id: $0.documentID ) })
                let pautasNonOptional = pautas.compactMap { $0 }
                completion(pautasNonOptional)
            }
        }
    }
    
}
