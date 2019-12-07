//
//  PautaTableViewCell.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 07/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class PautaTableViewCell: UITableViewCell, ConfigurableView {
    
    let longDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Autor: "
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    let actionButton: RoundButton = {
        let button = RoundButton(textButton: "Finalizar", height: 32)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([longDescription, authorLabel, actionButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            longDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            longDescription.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            longDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            
            authorLabel.leadingAnchor.constraint(equalTo: longDescription.leadingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            actionButton.trailingAnchor.constraint(equalTo: longDescription.trailingAnchor),
            actionButton.leadingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 8),
            actionButton.topAnchor.constraint(equalTo: longDescription.topAnchor, constant: 8),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupView(cellViewModel: PautaCellViewModel){
        self.longDescription.text = cellViewModel.pauta?.description
        self.authorLabel.text! += cellViewModel.pauta?.author ?? "none"
    }
}
