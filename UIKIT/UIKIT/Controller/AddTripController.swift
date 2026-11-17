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
        return label
    }()
    
    private let nomeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Lugar da viagem"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .words
        return textField
    }()
    
    private let dataIdaPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .compact
        return picker
    }()
    
    //    EXEMPLO DE NOVO PICKER:
    //    private let dataXPicker: UIDatePicker = {
    //        let picker_2 = UIDatePicker()
    //        picker_2.datePickerMode = .date
    //        return picker_2
    //    } ()
    
    
    private let dataVoltaPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .compact
        return picker
    }()
    
    private let favoritoSwitch = UISwitch()
    
    
    private let fecharButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fechar", for: .normal)
        return button
    }()

    private let salvarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fecharButton.addTarget(self, action: #selector(fecharSheet), for: .touchUpInside)
        salvarButton.addTarget(self, action: #selector(salvar), for: .touchUpInside)
        
        let headerStack = UIStackView(arrangedSubviews: [fecharButton, salvarButton])
        headerStack.axis = .horizontal
        headerStack.alignment = .center
        headerStack.distribution = .equalSpacing
        
        let dataIdaLabel = makeLabel("Data de ida")
        let dataVoltaLabel = makeLabel("Data de volta")
        let favoritoLabel = makeLabel("Favoritar")

        let dataIdaStack = UIStackView(arrangedSubviews: [dataIdaLabel, dataIdaPicker])
        dataIdaStack.axis = .horizontal
        dataIdaStack.alignment = .center
        dataIdaStack.distribution = .equalSpacing

        let dataVoltaStack = UIStackView(arrangedSubviews: [dataVoltaLabel, dataVoltaPicker])
        dataVoltaStack.axis = .horizontal
        dataVoltaStack.alignment = .center
        dataVoltaStack.distribution = .equalSpacing

        
        let favoritoStack = UIStackView(arrangedSubviews: [favoritoLabel, favoritoSwitch])
        favoritoStack.axis = .horizontal
        favoritoStack.alignment = .center
        favoritoStack.distribution = .equalSpacing

        
        let stackView = UIStackView(arrangedSubviews: [
            headerStack,
            tituloLabel,
            nomeTextField,
            dataIdaStack,
            dataVoltaStack,
            favoritoStack
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        //Posicionamento dos elementos
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    private func makeLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }
    
    
    @objc private func fecharSheet() {
        dismiss(animated: true)
    }

    @objc private func salvar() {
    }
}

#Preview {
    AddTripController()
}
