//
//  CartView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 02/09/22.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var productsViewModel = ProductsViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Products")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                Image(systemName: "plus")
                    .font(.title)
                    .padding(.horizontal)
                
            }
            .padding()
            
            TextField("Search product", text: $searchText)
                .font(.headline)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(20))
                .padding()
            
            List {
                ForEach(productsViewModel.products) { product in
                    ListRowView(product: product)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
