//
//  FavoriteViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 12/11/26.
//

import UIKit

class FavoriteViewController: UIViewController {
    private let texto = UILabel()
    private let seachController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        buscar()
        
        view.backgroundColor = .systemBackground
        texto.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(texto)
        NSLayoutConstraint.activate([
            texto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            texto.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func buscar() {
        seachController.searchResultsUpdater = self
        seachController.obscuresBackgroundDuringPresentation = false
        seachController.searchBar.placeholder = "Buscar favoritos"
        seachController.searchBar.searchBarStyle = .minimal
        seachController.searchBar.autocapitalizationType = .none
        seachController.searchBar.returnKeyType = .search
    }
    
    extension FavoriteViewController: UISearchResultsUpdating {
        func up
    }
}

#Preview {
    FavoriteViewController()
}
