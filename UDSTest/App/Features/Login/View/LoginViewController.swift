//
//  LoginViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.didTapInLogin = didTapInLogin(result:)
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    func didTapInLogin(result: Bool) -> Void {
        switch result {
        case true:
            print("deu certo merda")
        case false:
            print("nem deu")
        }
        
    }

}
