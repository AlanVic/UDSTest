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
        return self.pautas.count
    }
    
    func fetchData(completion: @escaping (Error?) -> Void) {
        self.getPautas { (pautas, error) in
            if let error = error {
                completion(error)
            } else {
                if pautas.count == 0{
                    let error = NSError(domain: "Não existe esse tipo de pautas", code: 0, userInfo: nil) as Error
                    completion(error)
                } else {
                    self.pautas = pautas.map({ PautaCellViewModel($0) })
                    completion(nil)
                }
            }
        }
    }
    
    func cellViewModel(toSection section: Int) -> PautaCellViewModel {
        if pautas.count == 0 {
            return PautaCellViewModel(Pauta())
        }
        let pautaCell = pautas[section]
        return pautaCell
    }
    
    func changeStatus(atSection section:Int, completion: @escaping (Error?) -> Void) {
        let pautaCell = pautas[section]
        if let pauta = pautaCell.pauta, let status = TypePautas(rawValue: pauta.status) {
            updatePauta(pauta: pautaCell, withStatus: status.oppositeValue()) { (error) in
                if let error = error{
                    completion(error)
                }else {
                    completion(nil)
                }
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
    
    private func updatePauta(pauta: PautaCellViewModel, withStatus status: TypePautas, completion: @escaping (Error?) -> Void) {
        if let pauta = pauta.pauta {
            colRef.document(pauta.uuid).updateData(["status" : status.rawValue]) { (error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                    completion(error)
                } else {
                   completion(nil)
                }
            }
        }
    }
    
    private func getPautas(completion: @escaping ([Pauta],Error?) -> Void) {
        colRef.whereField("status", isEqualTo: typePautas.rawValue).getDocuments { (querySnapshot, error) in
            if let error = error {
                completion([],error)
                print("Error getting documents: \(error)")
            } else {
                let pautas = querySnapshot!.documents.map({ Pauta(dictionary: $0.data(), id: $0.documentID ) })
                let pautasNonOptional = pautas.compactMap { $0 }
                completion(pautasNonOptional,nil)
            }
        }
    }
    
}
