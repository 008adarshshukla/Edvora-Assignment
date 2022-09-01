//
//  UsersModel.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 31/08/22.
//

import Foundation
struct UsersModel: Identifiable, Codable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case name = "name"
    }
}
