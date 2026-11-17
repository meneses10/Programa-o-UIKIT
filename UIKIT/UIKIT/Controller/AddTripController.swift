//
//  AddTripController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 16/11/26.
//

import UIKit

class AddTripController: UIViewController {
    private let tituloLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicionar viagem"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fecharButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fechar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        //Comportamento da sheet
        fecharButton.addTarget(self, action: #selector(fecharSheet), for: .touchUpInside)
        view.addSubview(tituloLabel)
        view.addSubview(fecharButton)
        NSLayoutConstraint.activate([
            tituloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            tituloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fecharButton.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 24),
            fecharButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func fecharSheet() {
    dismiss(animated: true)
    }
    
}

#Preview {
    AddTripController()
}
