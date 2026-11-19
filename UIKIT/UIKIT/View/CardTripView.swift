//
//  CardTripView.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 18/11/26.
//

import UIKit
//Por ser apenas um card, será bom criar uma classe com o tipo UIVIEW

class CardTripView: UIView {
    
    var trip: InfoTrip?
    
    var duration: Int {
        
        return 0
    }
    
    
    
    
    
    private let cardView: UIView = {
        //Apresentação do card
        let card = UILabel()
        card.backgroundColor = .gray
        card.layer.cornerRadius = 20
        card.layer.shadowColor = UIColor.black.cgColor
        card.layer.shadowOpacity = 0.08
        card.layer.shadowOffset = CGSize(width: 50, height: 40)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    } ()
    //Título do card
    private let textoCard: UILabel = {
        let title =  UILabel()
        title.text = "Nome da viagem"
        title.font = .systemFont(ofSize: 15)
        title.adjustsFontForContentSizeCategory = true
        title.translatesAutoresizingMaskIntoConstraints = false

        return title
    }()
    //Duracão da viagem
    private let durationTrip: UILabel = {
        let label =  UILabel()
        label.text = ""
        
        label.font = .systemFont(ofSize: 15)
        return label
    } ()
    
    
    init(trip: InfoTrip? = nil) {
        self.trip = trip
        super.init(frame: .zero)
        durationTrip.text = "\(duration) dias de viagem"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


#Preview {
    CardTripView()
}
