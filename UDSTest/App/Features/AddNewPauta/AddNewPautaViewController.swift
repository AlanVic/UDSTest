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

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        self.view = newPautaView
    }
    
}
