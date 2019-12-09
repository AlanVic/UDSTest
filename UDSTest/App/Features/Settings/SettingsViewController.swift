//
//  SettingsViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 04/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.didTapInOption = didTapInOption(settingOption:)
    }
    
    override func loadView() {
        self.view = settingsView
    }
    
    func didTapInOption(settingOption: SettingsOptions) {
        switch settingOption {
        case .Perfil:
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        case .Logout:
            FireAccess.logout()
            present(logoutAlertController(), animated: true, completion: nil)
        }
    }
    
    func logoutAlertController() -> UIAlertController {
        let alert = UIAlertController(title: "Logout", message: "Tem certeza que quer fazer logout?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Sim", style: .default) { (_) in
            self.present(LoginViewController(), animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "Não", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addActions(actions: [noAction,yesAction])
        return alert
    }

}
