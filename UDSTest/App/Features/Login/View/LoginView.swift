//
//  LoginView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class LoginView: UIView, ConfigurableView {
    
    let usernameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([usernameTextField, passwordTextField, loginButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 128),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            usernameTextField.heightAnchor.constraint(equalToConstant: 32),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 32),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
