//
//  CustomTabBarController.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 01/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import UIKit
private protocol ConfigurableTabBar {
    func setupTabBar()
    func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController
}

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkLoggedUser()
    }
    
    func checkLoggedUser() {
        if !FireAccess.isLogged() {
            self.present(LoginViewController(), animated: true, completion: nil)
        }
    }

}

extension CustomTabBarController: ConfigurableTabBar {
    fileprivate func setupTabBar() {
        self.viewControllers = [
            createNavigation(viewController: PautasViewController(withTypeController: .open), title: "Pautas Abertas", imageNamed: "pauta"),
            createNavigation(viewController: PautasViewController(withTypeController: .finished), title: "Pautas Fechadas", imageNamed: "pauta"),
            createNavigation(viewController: SettingsViewController(), title: "Configurações", imageNamed: "settings")
        ]
    }
    
    func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.title = title
        navigation.tabBarItem.image = UIImage(named: imageNamed)
//        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return navigation
    }
    
    
}
