//
//  RegisterVIewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 05/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit
import FirebaseAuth

struct RegisterVIewModel {
    let firebaseAuth = Auth.auth()
    
    func signUpUser(withEmail email:String, andPassword password:String, andUserName username: String, completion: @escaping (Error?) -> Void) {
        firebaseAuth.createUser(withEmail: email, password: password) { (user, error) in
            if error != nil { completion(error) }
            let changeRequest = self.firebaseAuth.currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if error != nil { completion(error) }
                completion(nil)
            })
        }
    }
}
