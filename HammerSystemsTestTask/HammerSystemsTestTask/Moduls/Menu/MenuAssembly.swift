//
//  MenuAssembly.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 16.10.2022.
//

import UIKit

enum MenuAssembly {
    
    static func build() -> UIViewController {
        
        let network = NetworkService()
        let interactor = MenuInteractor(network: network)
        let presenter = MenuPresenter(interactor: interactor)
        let controller = MenuViewController(presenter: presenter)
        
        return controller
    }
}
