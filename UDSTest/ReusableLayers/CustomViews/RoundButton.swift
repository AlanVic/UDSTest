//
//  RoundButton.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override var isEnabled: Bool {
        didSet{
            if self.isEnabled == false {
                self.alpha = 0.5
            } else {
                self.alpha = 1
            }
        }
    }
    
    var height: CGFloat?
    var conformingWidth: Bool?
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(textButton: String) {
        self.init(type: .system)
        self.setTitle(textButton, for: .normal)
    }
    
    convenience init(textButton: String, conformingWidth: Bool) {
        self.init(textButton: textButton)
        self.conformingWidth = conformingWidth
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        didSetupLayout()
    }
    
    func didSetupLayout() {
        
        if conformingWidth != nil {
            self.subviews.forEach {
                if let label = $0 as? UILabel{
                    let textButton = label.text!
                    let size: CGSize = textButton.size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)])
                    self.widthAnchor.constraint(equalToConstant: size.width + 16).isActive = true
                }
            }
        }
        
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = .blue
    }
    
}
