//
//  OrdersModel.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 31/08/22.
//

import Foundation
import Combine

struct OrdersModel: Identifiable, Codable {
    let id: Int
    let productID: Int
    let quantity: Int
    let userID: Int
    let orderDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "order_id"
        case productID = "product_id"
        case quantity = "quantity"
        case userID = "user_id"
        case orderDate = "order_date"
    }
}
