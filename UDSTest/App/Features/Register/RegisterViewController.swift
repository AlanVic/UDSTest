//
//  RegisterViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 05/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.didTapInRegister = registerAccount
        
        registerView.dismissController = {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func registerAccount(result: Bool) {
        switch result {
         case true:
             self.dismiss(animated: true, completion: nil)
         case false:
             presentAlertError()
         }
    }
    
    override func loadView() {
        self.view = registerView
    }

    func presentAlertError() {
        let alert = UIAlertController(title: "Erro", message: "Erro ao registrar uma conta, tente novamente", preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}
