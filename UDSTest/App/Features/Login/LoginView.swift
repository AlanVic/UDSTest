//
//  LoginView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class LoginView: UIView, ConfigurableView {
    
    let loginViewModel = LoginViewModel()
    
    let emailTextField: UITextField = {
        let textField = RoundTextField(placeHolder: "Email")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = RoundTextField(placeHolder: "Password")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = RoundButton(textButton: "Login")
        button.translatesAutoresizingMaskIntoConstraints = true
        button.addTarget(self, action: #selector(didTapInLoginButton), for: .touchDown)
        return button
    }()
    
    lazy var buttonSignUp: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SingUp", for: .normal)
//        button.setTitleColor(.blue, for: .application)
        button.addTarget(self, action: #selector(didTapInSignUpButton), for: .touchDown)
        return button
    }()
    
    var didTapInLogin:((Bool) -> Void)?
    var didTapInSignUp:(() -> Void)?
    
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
        addSubviews([emailTextField, passwordTextField, loginButton, buttonSignUp])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 128),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            buttonSignUp.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            buttonSignUp.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc func didTapInLoginButton(){
        let email = emailTextField.text
        let password = passwordTextField.text
        
        loginViewModel.loginAuth(withEmail: email, andPassword: password) { (result) in
            self.didTapInLogin?(result)
        }
    }
    
    @objc func didTapInSignUpButton() {
        didTapInSignUp?()
    }
}
