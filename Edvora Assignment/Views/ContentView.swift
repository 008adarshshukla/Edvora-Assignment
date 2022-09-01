//
//  ContentView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 31/08/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = OrdersViewModel()
    var body: some View {
        VStack {
            ForEach(vm.orders) { user in
                Text("\(user.quantity)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
