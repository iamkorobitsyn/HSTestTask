//
//  TabBarController.swift
//  HammerSystemsTestTask
//
//  Created by Александр Коробицын on 03.04.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        instanceViewControllers()
    }
    
    private func instanceViewControllers() {
        viewControllers = [instanceNavController(rootViewController: MenuViewController(),
                                                 title: "Меню",
                                                 image: UIImage(systemName: "fork.knife.circle.fill") ?? .add),
                           instanceNavController(rootViewController: ContactsViewController(),
                                                 title: "Контакты",
                                                 image: UIImage(systemName: "mappin.circle.fill") ?? .add),
                           instanceNavController(rootViewController: ProfileViewController(),
                                                 title: "Профиль",
                                                 image: UIImage(systemName: "person.circle.fill") ?? .add),
                           instanceNavController(rootViewController: BasketViewController(),
                                                 title: "Корзина",
                                                 image: UIImage(systemName: "basket.fill") ?? .add)]
    }
    
    
    private func instanceNavController(rootViewController: UIViewController,
                                       title: String,
                                       image: UIImage) -> UIViewController {
        let nav = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image

        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor.blue.withAlphaComponent(0.03)
        appearence.titleTextAttributes = [.foregroundColor: UIColor.red.withAlphaComponent(0.6)]
        nav.navigationBar.standardAppearance = appearence
        nav.navigationBar.scrollEdgeAppearance = appearence
        nav.navigationBar.tintColor = UIColor.red
        return nav
    }
}
