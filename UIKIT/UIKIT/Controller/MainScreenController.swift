//
//  ViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 11/11/26.
//

import UIKit
class MainScreenController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let home_tab = HomeViewController()
        home_tab.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
    

        let favorite_tab = favoriteViewController()
        favorite_tab.tabBarItem = UITabBarItem(title: "Home",image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        viewControllers = [
            UINavigationController(rootViewController: home_tab),
            UINavigationController(rootViewController: favorite_tab)
        ]
    }
  
    
}

#Preview{
    let visualizarTela = MainScreenController()
    return visualizarTela
}
