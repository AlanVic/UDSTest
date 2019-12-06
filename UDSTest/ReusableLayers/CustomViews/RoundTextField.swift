//
//  RoundTextField.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RoundTextField: UITextField {
    
    var cornerRadius: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeHolder: String) {
        self.init(frame: .zero)
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [:])
    }
    
    convenience init(placeHolder: String, cornerRadius: CGFloat) {
        self.init(placeHolder: placeHolder)
        self.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
       didSetupLayout()
    }
    
    func didSetupLayout(){
        self.layer.cornerRadius = cornerRadius != nil ? cornerRadius! : self.frame.height / 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
    }
}
