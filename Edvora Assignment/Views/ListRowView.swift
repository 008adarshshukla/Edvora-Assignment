//
//  ListRowView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 02/09/22.
//

import SwiftUI

struct ListRowView: View {
    let product: ProductsModel
    var body: some View {
        HStack {
            VStack {
                Text("\(product.id)")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 6)
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("In stock : \(product.stock)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .bold()
            }
            Spacer()
            VStack {
                Text("Price : Rs \(product.sellingPrice)")
                    .font(.body)
                    .bold()
                    .padding(.horizontal, 6)
                
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
        )
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(product: ProductsModel(id: 2, name: "jsdnkaks", stock: 12, sellingPrice: 90))
    }
}
