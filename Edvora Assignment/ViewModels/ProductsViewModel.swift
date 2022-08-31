//
//  ProductsViewModel.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 01/09/22.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    @Published var products: [ProductsModel] = []
    var productsSubscription: AnyCancellable?
    
    init() {
       getProducts()
    }
    
    func getProducts() {
        guard let url = URL(string: Constants.productsUrl) else {
            return
        }
        productsSubscription = NetworkingManager.download(url: url)
            .decode(type: [ProductsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedProducts in
                guard let self = self else {
                    return
                }
                self.products = returnedProducts
                self.productsSubscription?.cancel()
            })
    }
}

