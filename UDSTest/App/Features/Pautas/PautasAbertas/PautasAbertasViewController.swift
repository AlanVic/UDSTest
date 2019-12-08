//
//  PautasAbertasViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 02/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class PautasAbertasViewController: UIViewController {
    
    let pautasView = PautasAbertasView(typeView: .open)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupNavigation()
    }
    
    override func loadView() {
        self.view = pautasView
    }
    
    func setupNavigation(){
        title = "Pautas Abertas"
        let addPauta = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPauta))
        navigationItem.rightBarButtonItem = addPauta
    }
    
    @objc func addNewPauta() {
        let navigation = UINavigationController(rootViewController: AddNewPautaViewController())
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }

}
