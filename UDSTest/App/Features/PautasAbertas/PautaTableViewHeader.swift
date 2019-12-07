//
//  PautaTableViewHeader.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 07/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class PautaTableViewHeader: UITableViewHeaderFooterView, ConfigurableView {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = .boldSystemFont(ofSize: 14)
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
    
    let disclosureImage: UIImageView = {
        let image = UIImageView(image: UIImage(imageLiteralResourceName: "hide"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([titleLabel, shortDescription, disclosureImage])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: disclosureImage.leadingAnchor, constant: -4),
            
            shortDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            shortDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            shortDescription.trailingAnchor.constraint(equalTo: disclosureImage.leadingAnchor, constant: -4),
//            shortDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            disclosureImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            disclosureImage.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            disclosureImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            disclosureImage.widthAnchor.constraint(equalToConstant: 30),
            disclosureImage.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func setupView(withViewModel viewModel: PautaCellViewModel){
        titleLabel.text = viewModel.pauta?.title
        shortDescription.text = viewModel.pauta?.shortDescription
    }
    
}
