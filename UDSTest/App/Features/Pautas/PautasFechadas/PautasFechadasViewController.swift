//
//  PautasFechadasViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 08/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class PautasFechadasViewController: UIViewController {
        
    let pautasView = PautasView(typeView: .finished)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        setupNavigation()
    }
    
    override func loadView() {
        self.view = pautasView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pautasView.viewModel.fetchData { (error) in
            if let error = error {
                let nsError = error as NSError
                print(nsError.domain)
            }
        }
    }
    
    func setupNavigation(){
        title = "Pautas Fechadas"
    }

}
