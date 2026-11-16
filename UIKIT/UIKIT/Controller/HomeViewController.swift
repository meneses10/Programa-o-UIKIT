//
//  HomeViewController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 12/11/26.
//

import UIKit

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
        botao.setTitle("Aperte esse botão", for: .normal)
        botao.translatesAutoresizingMaskIntoConstraints = false
        return botao
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        texto.translatesAutoresizingMaskIntoConstraints = false
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
}

#Preview {
    HomeViewController()
}
