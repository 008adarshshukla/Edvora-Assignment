//
//  UsersViewModel.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 01/09/22.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [UsersModel] = []
    var usersSubscription: AnyCancellable?
    
    init() {
       getUsers()
    }
    
    func getUsers() {
        guard let url = URL(string: Constants.usersUrl) else {
            return
        }
        usersSubscription = NetworkingManager.download(url: url)
            .decode(type: [UsersModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedUsers in
                guard let self = self else {
                    return
                }
                self.users = returnedUsers
                self.usersSubscription?.cancel()
            })
    }
}
