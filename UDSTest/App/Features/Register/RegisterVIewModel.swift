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
    
    func signUpUser(withEmail email:String?, andPassword password:String?, completion: @escaping (Bool) -> Void) {
        guard let userEmail = email, let userPassword = password else { return completion(false) }
        
        firebaseAuth.createUser(withEmail: userEmail, password: userPassword) { (user, error) in
            if error != nil { completion(false) }
            
//            user.
            completion(true)
        }
    }
}
