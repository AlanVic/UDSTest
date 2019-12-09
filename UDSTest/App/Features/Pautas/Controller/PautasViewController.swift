//
//  PautasViewController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 09/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit

class PautasViewController: UIViewController {

    lazy var pautasView = PautasView(typeView: typeController)
    
    var typeController: TypePautas
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        typeController = .open
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(withTypeController type: TypePautas) {
        self.init(nibName: nil, bundle: nil)
        typeController = type
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
                print(error.localizedDescription)
            }
        }
    }
    
    func setupNavigation(){
        switch typeController {
        case .finished:
            title = "Pautas Fechadas"
        case .open:
            title = "Pautas Abertas"
            let addPauta = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPauta))
            navigationItem.rightBarButtonItem = addPauta
        }
    }
    
    @objc func addNewPauta() {
        let navigation = UINavigationController(rootViewController: AddNewPautaViewController())
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }

}
