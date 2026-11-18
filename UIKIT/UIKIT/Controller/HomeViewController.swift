//
//  HomeViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 12/11/26.
//

import UIKit
import SwiftData

class HomeViewController: UIViewController {
    private let texto = UILabel()
    
    private let colocarTexto: UILabel = {
      
        let label2 = UILabel()
        label2.text = "Nenhuma viagem registrada"
        label2.textAlignment = .center
        label2.numberOfLines = 0
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    } ()
    private let acaoBotao: UIButton = {
        let botao = UIButton(type: .system)
        botao.setTitle("Adicione suas viagens", for: .normal)
        botao.translatesAutoresizingMaskIntoConstraints = false
        return botao
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        acaoBotao.addTarget(self, action: #selector(showSheet), for: .touchUpInside)
        texto.translatesAutoresizingMaskIntoConstraints = false
        texto.font = .systemFont(ofSize: 200)
        texto.font = UIFont.boldSystemFont(ofSize: 24)

        view.addSubview(texto)
        view.addSubview(acaoBotao)
        view.addSubview(colocarTexto)
        NSLayoutConstraint.activate([
            //Texto centralizado para o navigationTitle
            texto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            texto.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //botao centralizado pegando como referencia a view
            acaoBotao.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            acaoBotao.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //Centralizacao do botão
            colocarTexto.bottomAnchor.constraint(equalTo: acaoBotao.topAnchor),
            colocarTexto.centerXAnchor.constraint(equalTo: acaoBotao.centerXAnchor)
            
        ])
    }
    @objc private func showSheet() {
        let sheet = AddTripController()
            //estilos de sheet
        sheet.modalPresentationStyle = .pageSheet
        //Condicao para que apareça sheet ou não
        if let sheetController = sheet.sheetPresentationController{
            sheetController.detents = [.medium(), .large()]
            sheetController.prefersGrabberVisible = true
            sheetController.preferredCornerRadius = 20
        }
            present(sheet, animated: true)
        
    }
}

#Preview {
    HomeViewController()
}
