//
//  RoundTextField.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 03/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RoundTextField: UITextField {
    
    var height: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeHolder: String) {
        self.init(frame: .zero)
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [:])
    }
    
//    convenience init(placeHolder: String, height: CGFloat) {
//        self.init(placeHolder: placeHolder)
//        self.height = height
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
       didSetupLayout()
    }
    
    func didSetupLayout(){
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
    }
}
