//
//  ConfigurableView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

protocol ConfigurableView: UIView {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ConfigurableView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
}
