//
//  FireAccess.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 02/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import FirebaseAuth

struct FireAccess {
    /// Method verify if user is current logged, if not make something.
    static func isLogged() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
    /// Get current e-mail
    static func currentUserId() -> String {
        if isLogged() {
            return Auth.auth().currentUser?.uid ?? ""
        } else {
            return ""
        }
    }
    
    static func currentUserName() -> String {
        if isLogged() {
            return Auth.auth().currentUser?.displayName ?? ""
        } else {
            return ""
        }
    }
    
    static func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Erro ao log out")
            print(error)
        }
    }
}

