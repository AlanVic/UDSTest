//
//  ProfileViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 09/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

struct ProfileViewModel {
    var name: String {
        return FireAccess.currentUserName()
    }
    var email: String {
        return FireAccess.currentEmail()
    }
}
