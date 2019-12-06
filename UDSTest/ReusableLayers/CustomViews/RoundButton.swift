//
//  RoundButton.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(textButton: String) {
        self.init(type: .system)
        self.setTitle(textButton, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        didSetupLayout()
    }
    
    func didSetupLayout() {
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = .blue
    }
    
}
