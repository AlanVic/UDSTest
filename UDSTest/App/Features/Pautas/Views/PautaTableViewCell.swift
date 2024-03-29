//
//  PautaTableViewCell.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 07/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

protocol PautaViewDelegate {
    func didTapActionButton(button: UIButton)
}

class PautaTableViewCell: UITableViewCell, ConfigurableView {
    
    let longDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Autor: "
        label.font = .italicSystemFont(ofSize: 12)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    lazy var actionButton: RoundButton = {
        let button = RoundButton(textButton: "Alguma", conformingWidth: true)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        button.addTarget(self, action: #selector(didTapActionButton), for: .touchDown)
        return button
    }()
    
    var type: TypePautas?
    
    var delegate: PautaViewDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapActionButton(button: UIButton) {
        delegate?.didTapActionButton(button: button)
    }
    
    func buildViewHierarchy() {
        addSubviews([longDescription, authorLabel, actionButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            longDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            longDescription.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            longDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            authorLabel.leadingAnchor.constraint(equalTo: longDescription.leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: longDescription.bottomAnchor, constant: 4),
            
            actionButton.trailingAnchor.constraint(equalTo: longDescription.trailingAnchor),
            actionButton.topAnchor.constraint(equalTo: longDescription.bottomAnchor, constant: 4),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func setupView(cellViewModel: PautaCellViewModel){
        self.longDescription.text = cellViewModel.pauta?.description
        self.authorLabel.text! = "Autor: \(cellViewModel.pauta?.author ?? "none")"
        let type = TypePautas(rawValue: cellViewModel.pauta?.status ?? "Aberto")
        switch type {
        case .finished:
            self.actionButton.setTitle("Abrir", for: .normal)
        case .open:
            self.actionButton.setTitle("Fechar", for: .normal)
        case .none:
            self.actionButton.setTitle("Fechar", for: .normal)
        }
    }
}
