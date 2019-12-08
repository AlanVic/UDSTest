//
//  AddNewPautaViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation
import Firebase

class AddNewPautaViewModel {
    private var editableFields: [Editable]
    
    private var colRef: CollectionReference!
    
    private var buttonEnabled = false {
        didSet{
            enableButton?(buttonEnabled)
        }
    }
    
    var enableButton: ((Bool) -> Void)?
    
    init(withEditableFields editableFields: [Editable]){
        colRef = Firestore.firestore().collection("Pautas")
        self.editableFields = editableFields
        
        editableFields.forEach {
            $0.didChanged = didChanged
        }
    }
    
    func didChanged() {
        let allHasText = editableFields.allSatisfy { (editable) -> Bool in
            return editable.currentText != nil && editable.currentText != ""
        }
        
        buttonEnabled = allHasText
        print(allHasText)
    }
    
    func createNewPauta(withTitle title: String,
                        andShortDescription shortDescription: String,
                        andFullDescription description: String,
                        completion: @escaping (Error?) -> Void) {
        let currentAuthor = FireAccess.currentUserName()
        let uuid = UUID().uuidString
        let pauta = Pauta(title: title, shortDescription: shortDescription, description: description, author: currentAuthor, status: TypePautas.open.rawValue, uuid: uuid)
        
        colRef.document(uuid).setData(pauta.dictionary) { (error) in
            if error != nil {
                completion(error)
                print("oh louco deu erro")
            } else {
                completion(nil)
                print("Salvo com sucesso")
            }
        }
//        colRef.addDocument(data: pauta.dictionary) { (error) in
//
//        }
    }
}
