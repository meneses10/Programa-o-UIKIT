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
        homeTab.title = "Liste suas viagens"

        let favoriteTab = FavoriteViewController()
        favoriteTab.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        favoriteTab.title = "Favoritos"

        
        //Eu guardp tanto a tab HOME quanto FAVORITE para usar depois
        let homeNavigation = UINavigationController(rootViewController: homeTab)
        let favoriteNavigation = UINavigationController(rootViewController: favoriteTab)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 24, weight: .bold)
        ]
//Estou declarando a aparencia dos títulos
        [homeNavigation, favoriteNavigation].forEach { navigation in
            navigation.navigationBar.standardAppearance = appearance
            navigation.navigationBar.scrollEdgeAppearance = appearance
            navigation.navigationBar.compactAppearance = appearance
        }
//NEssa parte eu referencio as tabs guardadas chamando apenas o nome lá de cim
        viewControllers = [
            homeNavigation,
            favoriteNavigation
        ]
    }
}

#Preview {
    MainScreenController()
}
