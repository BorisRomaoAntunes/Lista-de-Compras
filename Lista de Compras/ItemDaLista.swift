//
//  ItemDaLista.swift
//  Lista de Compras
//
//  Created by Boris R on 08/05/23.
//

import Foundation
struct itemDaLista: Identifiable,Codable {
    var id = UUID ()
    let name: String
    let qtd: Int
    let valorUnintario: Double
}
