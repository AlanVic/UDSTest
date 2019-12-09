//
//  SettingsViewModel.swift
//  UDSTest
//
//  Created by Alan Victor Paulino de Oliveira on 04/12/19.
//  Copyright © 2019 Alan Victor Paulino de Oliveira. All rights reserved.
//

import Foundation

enum SettingsOptions: String, CaseIterable {
    case Perfil = "Perfil"
    case Logout = "Logout"
}

struct SettingsViewModel {
    let settingsOptions = SettingsOptions.allCases
    
    func numberOfRows() -> Int {
        return settingsOptions.count
    }
    
    func stringOption(fromIndexpath indexpath: IndexPath) -> String {
        let stringOption = settingsOptions[indexpath.row].rawValue
        return stringOption
    }
    
    func option(fromIndexPath indexpath:IndexPath) -> SettingsOptions {
        return settingsOptions[indexpath.row]
    }
}
