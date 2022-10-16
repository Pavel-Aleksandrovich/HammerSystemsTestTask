//
//  TabBarAssembly.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 13.10.2022.
//

import UIKit

final class TabBarAssembly: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createMenuViewController(),
                           createContactViewController(),
                           createProfileViewController(),
                           createCartViewController()]
        
        tabBar.tintColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1)
    }
}

private extension TabBarAssembly {
    
    func createMenuViewController() -> UIViewController {
        let vc = MenuAssembly.build()
        let image = ImageFamily.menu.name
        vc.tabBarItem = UITabBarItem(title: "Меню",
                                     image: image,
                                     tag: 0)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createContactViewController() -> UIViewController {
        let vc = UIViewController()
        let image = ImageFamily.contact.name
        vc.tabBarItem = UITabBarItem(title: "Контакты",
                                     image: image,
                                     tag: 1)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createProfileViewController() -> UIViewController {
        let vc = UIViewController()
        let image = ImageFamily.profile.name
        vc.tabBarItem = UITabBarItem(title: "Профиль",
                                     image: image,
                                     tag: 2)
        
        return UINavigationController(rootViewController: vc)
    }
    
    func createCartViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let image = ImageFamily.cart.name
        vc.tabBarItem = UITabBarItem(title: "Корзина",
                                     image: image,
                                     tag: 3)
        
        return UINavigationController(rootViewController: vc)
    }
}
