//
//  RoundTextView.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class RoundTextView: UITextView, Editable {
    var currentText: String? {
        if self.text == placeHolder{
            return ""
        } else {
           return text
        }
    }
    
    var didChanged: (() -> Void)?
    
    var placeHolder: String?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(placeHolder: String) {
        self.init(frame: .zero, textContainer: nil)
        self.placeHolder = placeHolder
        self.text = placeHolder
        self.textColor = UIColor.lightGray
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        didSetupLayout()
    }
    
    func didSetupLayout() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
    }
}

extension RoundTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        didChanged?()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor.lightGray
        }
    }
}
