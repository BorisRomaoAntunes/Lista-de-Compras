//
//  ListaDeConpras.swift
//  Lista de Compras
//
//  Created by Boris R on 08/05/23.
//

import Foundation

class ListaDeCopras: ObservableObject {
    @Published var Itens = [itemDaLista] () {
       

        didSet{
            if let encoder = try? JSONEncoder().encode(Itens) {
                UserDefaults.standard.set(encoder, forKey: "Itenspadrão")
            }
        }
    }
    init() {
        if let dadosSalvos = UserDefaults.standard.data(forKey: "Itenspadrão") {
            if let deconder = try? JSONDecoder().decode([itemDaLista].self, from: dadosSalvos){
                Itens = deconder
                return
            }
        }
        Itens = []
        
    }
    func calculoSomaTotal() -> Double {
        var total = 0.0
        
        for item in Itens {
            total += item.valorUnintario
        }
        return total
    }
    func calculoSomaTotaItens() -> Int{
        var total = 0
        for item in Itens {
            total += item.qtd
        }
        return total
    }
    
}

