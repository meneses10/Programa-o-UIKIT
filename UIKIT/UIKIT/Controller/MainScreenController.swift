//
//  MainScreenController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 11/11/26.
//

import UIKit

class MainScreenController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeTab = HomeViewController()
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeTab.title = "Listar suas viagens."

        let favoriteTab = FavoriteViewController()
        favoriteTab.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        favoriteTab.title = "Favoritos"

        viewControllers = [
            UINavigationController(rootViewController: homeTab),
            UINavigationController(rootViewController: favoriteTab)
        ]
    }
}

#Preview {
    MainScreenController()
}
