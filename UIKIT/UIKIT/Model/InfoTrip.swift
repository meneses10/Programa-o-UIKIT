//
//  Data.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 18/11/26.
//
//Local salvo para os dados
import Foundation
import SwiftData

@Model
final class InfoTrip {
    var place: String
    var DataIda: Date
    var DataVotla: Date
    var Duration: Int
    var IsFavorite: Bool
    
    init(place: String, DataIda: Date, DataVotla: Date, Duration: Int, IsFavorite: Bool) {
        self.place = place
        self.DataIda = DataIda
        self.DataVotla = DataVotla
        self.Duration = Duration
        self.IsFavorite = IsFavorite
    }
  }
