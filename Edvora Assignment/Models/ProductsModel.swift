//
//  ProductsModel.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 31/08/22.
//

import Foundation
import Combine

struct ProductsModel: Identifiable, Codable {
    let id: Int
    let name: String
    let stock: Int
    let sellingPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "product_id"
        case name = "name"
        case stock = "stock"
        case sellingPrice = "selling_price"
    }
}
