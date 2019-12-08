//
//  PautaTableViewHeader.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 07/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

protocol PautaTableViewHeaderDelegate: class {
    func didExpandButtonTap(button: UIButton)
}

class PautaTableViewHeader: UITableViewHeaderFooterView, ConfigurableView {
    
    var delegate: PautaTableViewHeaderDelegate?
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = .boldSystemFont(ofSize: 14)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    let shortDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 12)
        label.text = "Pequena descrição "
        return label
    }()
    
    lazy var disclosureButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        button.addTarget(self, action: #selector(didExpandButtonTap), for: .touchUpInside)
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didExpandButtonTap(button: UIButton) {
        delegate?.didExpandButtonTap(button: button)
    }
    
    func buildViewHierarchy() {
        contentView.addSubviews([titleLabel, shortDescription, disclosureButton])
    }
    
    func setupConstraints() {
        self.contentView.autoresizingMask = .flexibleHeight
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: disclosureButton.leadingAnchor, constant: -4),
            
            shortDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            shortDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            shortDescription.trailingAnchor.constraint(equalTo: disclosureButton.leadingAnchor, constant: -4),
            shortDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            disclosureButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
//            disclosureImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
//            disclosureImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            disclosureButton.widthAnchor.constraint(equalToConstant: 30),
            disclosureButton.heightAnchor.constraint(equalTo: disclosureButton.widthAnchor),
            disclosureButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupView(withViewModel viewModel: PautaCellViewModel){
        titleLabel.text = viewModel.pauta?.title
        shortDescription.text = viewModel.pauta?.shortDescription
        let isSelected = viewModel.isExpanded
        disclosureButton.setImage(isSelected ? UIImage(named: "expand") : UIImage(named: "hide"), for: .normal)
    }
    
}
