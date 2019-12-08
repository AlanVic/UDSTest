//
//  LoginView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 05/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RegisterView: UIView, ConfigurableView {
    
    let nameTextField: RoundTextField = {
        let tf = RoundTextField(placeHolder: "Nome")
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailTextField: RoundTextField = {
        let tf = RoundTextField(placeHolder: "Email")
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
   
    let passwordTextField: RoundTextField = {
         let tf = RoundTextField(placeHolder: "Senha")
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
     }()
    
    let registerButton: RoundButton = {
        let button = RoundButton(textButton: "Register")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapInRegisterButton), for: .touchDown)
        return button
    }()
    
    var didTapInRegister: (() -> Void)?
    
    let viewModel = RegisterVIewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapInRegisterButton() {
        viewModel.signUpUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!, andUserName: nameTextField.text!) { [weak self] (error) in
            if error != nil {
                print("Erro na criação da conta: \(error!)")
                return
            } else {
                self?.didTapInRegister?()
            }
        }
    }
    
    
    func buildViewHierarchy() {
        addSubviews([nameTextField, emailTextField, passwordTextField, registerButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 128),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
