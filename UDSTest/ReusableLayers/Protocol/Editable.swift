//
//  Editable.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

protocol Editable : class {
    var didChanged: (() -> Void)? { get set }
    var currentText: String? { get }
}

extension Editable where Self: UITextView {
    var currentText: String {
        return self.text
    }
}

extension Editable where Self: UITextField {
    var currentText: String {
        return self.text ?? ""
    }
}
