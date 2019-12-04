//
//  LoginViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation
import FirebaseAuth

struct LoginViewModel {
    
    let firebaseAuth = Auth.auth()
    
    func loginAuth(withEmail email: String?, andPassword password: String?, completion: @escaping (Bool) -> Void) {
        guard let userEmail = email, let userPassword = password else {
            return completion(false)
        }
        
        firebaseAuth.signIn(withEmail: userEmail, password: userPassword) { (_, error) in
            if error != nil { return completion(false) }
            completion(true)
        }
    }
    
}
