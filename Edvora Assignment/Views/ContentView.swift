//
//  ContentView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 31/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = UsersViewModel()
    @State var selectedTab: Int = 0
    
    init() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = .white
        
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                CustomerView()
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Customer")
                    }
                    .tag(0)
                
                CartView()
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Cart")
                    }
                    .tag(1)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(3)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
