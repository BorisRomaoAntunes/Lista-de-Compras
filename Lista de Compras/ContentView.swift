//
//  ContentView.swift
//  Lista de Compras
//
//  Created by Boris R on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listaDeCompras = ListaDeCopras()
    @State private var showingViewAddItem = false
    @State private var somaTota: Double = 0.0

    var body: some View {
        NavigationView{
            VStack{
               Text("Lista de Compras")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Text (listaDeCompras.calculoSomaTotal(), format: .currency(code: "BRL"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.633, green: 0.363, blue: 0.966))
                Text((Int (listaDeCompras.calculoSomaTotaItens())) == 1 ? "🛒\(Int (listaDeCompras.calculoSomaTotaItens())) Item" : "🛒\(Int (listaDeCompras.calculoSomaTotaItens())) Itens" )
                    .bold()
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                List{
                    ForEach(listaDeCompras.Itens){ item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name)
                                    
                                    .multilineTextAlignment(.leading)
                                    .font(.title2)
                                Text("Por deste Item: \(String(item.qtd)) ")
                                    .fontWeight(.light)
                                    .foregroundColor(.secondary)
                           }
                            Spacer()
                            Text(item.valorUnintario, format: .currency(code: "BRL"))
                                .font(.title)
                              
                                .fontWeight(.medium)
                                
                                

                        }
                    }
                    .onDelete(perform: removendoItem)
                }
                
                HStack{
                    Button("Adicionar"){
                showingViewAddItem = true
//                      } label: {
//                        Rectangle()
//                            .frame(width: .infinity, height: 100)
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                            .font(.largeTitle)
//                            .shadow(radius: 30)
//                            .foregroundColor(.purple)
//                            .padding()
                    }

                }
            }
//            .navigationTitle("Lista de Compras")
            
            .sheet(isPresented: $showingViewAddItem){
                ViewAddItem (ListaDeComprasItens : listaDeCompras)
            }
        }
        
    }
    func removendoItem(at offset: IndexSet) { // func para remover um item que o usuario quiser
        listaDeCompras.Itens.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
