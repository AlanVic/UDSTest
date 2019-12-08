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
        registerView.didTapInRegister = {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func loadView() {
        self.view = registerView
    }

}
