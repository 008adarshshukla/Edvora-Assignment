//
//  OrdersViewModel.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 01/09/22.
//

import Foundation
import Combine

class OrdersViewModel: ObservableObject {
    @Published var orders: [OrdersModel] = []
    var ordersSubscription: AnyCancellable?
    
    init() {
       getProducts()
    }
    
    func getProducts() {
        guard let url = URL(string: Constants.ordersUrl) else {
            return
        }
        ordersSubscription = NetworkingManager.download(url: url)
            .decode(type: [OrdersModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedOrders in
                guard let self = self else {
                    return
                }
                self.orders = returnedOrders
                self.ordersSubscription?.cancel()
            })
    }
}

