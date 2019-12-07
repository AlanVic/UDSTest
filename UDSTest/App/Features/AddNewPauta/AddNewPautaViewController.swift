//
//  AddNewPautaViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 06/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class AddNewPautaViewController: UIViewController {

    let newPautaView = AddNewPautaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        newPautaView.createdNewPauta = {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func configNavigationBar(){
        let barButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelButton))
        
        self.navigationItem.rightBarButtonItem = barButton
    }

    @objc func cancelButton(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    override func loadView() {
        self.view = newPautaView
    }
    
}
