//
//  HomeView.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 12/11/26.
//
import UIKit

class HomeViewController: UIViewController {
    private let texto = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(texto)
        NSLayoutConstraint.activate([
            texto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            texto.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
 
 }


#Preview{
    let visualizarTela = HomeViewController()
    return visualizarTela
}




