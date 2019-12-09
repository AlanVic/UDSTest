//
//  ProfileViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 09/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        self.view = profileView
    }
    
    func setupNavigation() {
        title = "Configurações"
    }
}
