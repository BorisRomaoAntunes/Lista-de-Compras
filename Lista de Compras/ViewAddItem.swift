//
//  ViewAddItem.swift
//  Lista de Compras
//
//  Created by Boris R on 08/05/23.
//

import SwiftUI

struct ViewAddItem: View {
    @FocusState private var FocoEntradaNome: Bool
    
    @ObservedObject var ListaDeComprasItens: ListaDeCopras
    @Environment(\.dismiss) var dismiss
    
    @State private var nome = ""
    @State private var valorUnitario = 0.0
    @State private var qtd : Int = 1
    
    //💡 neste item eu quero colocar aquele botão que tem um "- e +" para ir incrementando a quantidade de itens
    //💡 Adicionar um botao de salve item novo abaixo do valor para facilita a adicao
    
    var body: some View {
        NavigationView{
            
            VStack(){
                Form {
                    
                    Section{
                        TextField("Digite o Nome do Item", text: $nome)
                            .focused($FocoEntradaNome)
                        }
                    
                    Section{
                        Stepper("Quantidade: \(qtd)",value: $qtd, in: 1...100, step: 1)
                        
                            .padding(.bottom, 8.0)
                            .font(.title2)
                            
                        TextField("Valor", value: $valorUnitario, format: .currency(code: "BRL"))
                           // .textContentType(.valorUnitario)
                            .keyboardType(.decimalPad)
                            .bold()
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                    }
                }
                .onAppear{
                    FocoEntradaNome = true
                }
            }
            .toolbar{
                Button() {
                    let Intem = itemDaLista(name: nome, qtd: qtd, valorUnintario: valorUnitario)
                    ListaDeComprasItens.Itens.append(Intem)
                    
                    dismiss()
                    
                } label: {
                    Text("Add \(Image(systemName:"plus"))")
                        .font(.title3)
                }
            }
            .navigationTitle("🛒 Novo Item")
        
        }
    }
}
struct ViewAddItem_Previews: PreviewProvider {
    static var previews: some View {
        ViewAddItem(ListaDeComprasItens: ListaDeCopras())
    }
}
