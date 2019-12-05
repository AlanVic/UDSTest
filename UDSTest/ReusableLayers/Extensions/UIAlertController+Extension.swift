//
//  UIAlertController+Extension.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 04/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func buildAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
//        alert.view.tintColor = .titleColor
//        alert.changeAlertBackgroundColor(color: .backgroundColor)
        alert.changeAlertCornerRadius(radius: 12)
        return alert
    }

    
    static func buildActionSheet(title: String, message: String?) -> UIAlertController {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let attributedString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        actionSheet.setValue(attributedString, forKey: "attributedTitle")
//        actionSheet.view.tintColor = .tabBarIcon
//        actionSheet.changeAlertBackgroundColor(color: .backgroundColor)
        actionSheet.changeAlertCornerRadius(radius: 12)
        
        return actionSheet
    }
    
    func changeAlertBackgroundColor(color: UIColor) {
        guard let subview = self.view.subviews.first?.subviews.first?.subviews.first else {
            return print("No view to change background color")
        }
        subview.backgroundColor = color
    }
    
    func changeAlertCornerRadius(radius: CGFloat) {
        guard let subview = self.view.subviews.first?.subviews.first?.subviews.first else {
            return print("No view to change background color")
        }
        subview.layer.cornerRadius = radius
    }
    
    func addActions(actions: [UIAlertAction]) {
        actions.forEach { self.addAction($0) }
    }
    
    func setPositionAtCenterOf(view: UIView) {
        if let popoverController = self.popoverPresentationController {
          popoverController.sourceView = view
          popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
          popoverController.permittedArrowDirections = []
        }
    }
    
   
}
