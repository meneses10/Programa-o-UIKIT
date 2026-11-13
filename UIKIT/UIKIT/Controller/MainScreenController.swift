//
//  ViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 11/11/26.
//

import UIKit
import SwiftUI
class MainScreenController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    
    
    private func setupTabs(){
        let home = UIHostingController(rootView: HomeView())
        home.tabBarItem = UITabBarItem(
            title: "Home:",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        let favorite = UIHostingController(rootView: favoriteview())
        favorite.tabBarItem = UITabBarItem(
            title:"Favoritos",
            image: UIImage(systemName: "plus.circle"),
            selectedImage: UIImage(systemName: "plus.circle.fill")
        )
        viewControllers = [
            UINavigationController(rootViewController: home),
            UINavigationController(rootViewController: favorite)
        ]
    }


    
    
}

