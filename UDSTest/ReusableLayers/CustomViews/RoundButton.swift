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
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(textButton: String) {
        self.init(type: .system)
        self.setTitle(textButton, for: .normal)
    }
    
    convenience init(textButton: String, height:CGFloat) {
        self.init(textButton: textButton)
        self.height = height
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        didSetupLayout()
    }
    
    func didSetupLayout() {
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
            self.sizeToFit()
        }
        
//        if let height = height {
//            self.heightAnchor.constraint(equalToConstant: height).isActive = true
//            self.subviews.forEach {
//                if let label = $0 as? UILabel{
//                    let nsString = label.text! as NSString
//                    nsString.size(withAttributes: [font : Any]?)
//                }
//            }
//        }
        
        
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = .blue
    }
    
}
