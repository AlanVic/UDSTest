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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.didTapInLogin = didTapInLogin(result:)
        loginView.didTapInSignUp = didTapInSignUp
    }
    
    override func loadView() {
        self.view = loginView
    }
    
    func didTapInLogin(result: Bool) -> Void {
        switch result {
        case true:
            self.dismiss(animated: true, completion: nil)
        case false:
            presentAlertError()
        }
    }
    
    func didTapInSignUp() {
        present(RegisterViewController(), animated: true, completion: nil)
    }

    func presentAlertError() {
        let alert = UIAlertController(title: "Erro", message: "Erro ao fazer login", preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}
