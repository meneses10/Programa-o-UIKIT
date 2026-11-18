//
//  DataController.swift
//  UIKIT
//
//  Created by Carlos Eduardo de Sousa Meneses on 18/11/26.
//
import SwiftData

final class DataController {
    static let shared = DataController()
    
    let container: ModelContainer
    var context: ModelContext{container.mainContext}
    
    
    private init() {
        do{
            container = try ModelContainer(for: InfoTrip.self)
        } catch{
            fatalError("não deu certo criar seu ModelContainer") //Um ModelContainer é como se fosse seu banco de dados no Swift Data
            //ModelContext é o lugar que você vai ter os dados desejados
        }
        
        
    }
}
