//
//  CartView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 02/09/22.
//

import SwiftUI

struct CartView: View {
    
    @StateObject private var productsViewModel = ProductsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Products")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            
            List {
                ForEach(productsViewModel.products) { product in
                    ListRowView(product: product)
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
