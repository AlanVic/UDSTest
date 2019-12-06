//
//  AddNewPautaView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class AddNewPautaView: UIView, ConfigurableView {
    let titleLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Titulo:"
        return label
    }()
    
    let titleTf: RoundTextField = {
        let textField = RoundTextField(placeHolder: "Digite o titulo", cornerRadius: 10)
        return textField
    }()
    
    let breveDescricaoLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Breve Descrição:"
        return label
    }()
    
    let breveDescricaoTf: RoundTextField = {
        let textField = RoundTextField(placeHolder: "Digite uma breve descrição", cornerRadius: 10)
        return textField
    }()
    
    let detailsLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detalhes:"
        return label
    }()
    
    let detailsTv: RoundTextView = {
        let textView = RoundTextView(placeHolder: "Digite mais detalhes da pauta")
        textView.font = .systemFont(ofSize: 18)
        return textView
    }()
    
    let authorLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Autor:"
        return label
    }()
    
    lazy var doneButton: RoundButton = {
        let button = RoundButton(textButton: "Criar")
        button.addTarget(self, action: #selector(didTapDoneButton), for: .touchDown)
        button.isEnabled = false
        return button
    }()
    
    lazy var viewModel = AddNewPautaViewModel(withEditableFields: [titleTf, breveDescricaoTf, detailsTv])
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
        viewModel.enableButton = buttonResponsable
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonResponsable(buttonEnabled: Bool) {
        doneButton.isEnabled = buttonEnabled
    }
    
    @objc func didTapDoneButton() {
        viewModel.createNewPauta(withTitle: "Alan", andShortDescription: "Short", andFullDescription: "Full Description")
    }
    
    func buildViewHierarchy() {
        addSubviews([titleLabel,
                     titleTf,
                     breveDescricaoLabel,
                     breveDescricaoTf,
                     detailsLabel,
                     detailsTv,
                     authorLabel,
                     doneButton
                ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            titleTf.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            titleTf.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTf.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleTf.heightAnchor.constraint(equalToConstant: 32),
            
            breveDescricaoLabel.topAnchor.constraint(equalTo: titleTf.bottomAnchor, constant: 8),
            breveDescricaoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            breveDescricaoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            breveDescricaoTf.topAnchor.constraint(equalTo: breveDescricaoLabel.bottomAnchor, constant: 4),
            breveDescricaoTf.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            breveDescricaoTf.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            breveDescricaoTf.heightAnchor.constraint(equalToConstant: 32),
            
            detailsLabel.topAnchor.constraint(equalTo: breveDescricaoTf.bottomAnchor, constant: 8),
            detailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            detailsTv.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 4),
            detailsTv.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            detailsTv.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            detailsTv.heightAnchor.constraint(equalToConstant: 300),
            
            doneButton.topAnchor.constraint(equalTo: detailsTv.bottomAnchor, constant: 8),
            doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            doneButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
