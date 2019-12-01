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
        self.view.backgroundColor = .blue
    }

}

extension CustomTabBarController: ConfigurableTabBar {
    fileprivate func setupTabBar() {
        self.viewControllers = [
            createNavigation(viewController: LoginViewController(), title: "Login", imageNamed: "profile-icon"),
            createNavigation(viewController: LoginViewController(), title: "Login", imageNamed: "profile-icon")
        ]
    }
    
    func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.tabBarItem.image = UIImage(named: imageNamed)
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return navigation
    }
    
    
}
