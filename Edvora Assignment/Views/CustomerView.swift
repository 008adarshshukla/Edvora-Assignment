//
//  CustomerView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 02/09/22.
//

import SwiftUI

struct CustomerView: View {
    
    @StateObject private var userViewModel = UsersViewModel()
    let column: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Customers")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            }
            .padding()
            
            ScrollView {
                LazyVGrid(columns: column) {
                    ForEach(userViewModel.users) { user in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(AngularGradient(colors: [Color.red, Color.blue], center: .bottomTrailing, angle: .degrees(45)))
                            .frame(height: 100)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
                            .overlay(alignment: .center) {
                                VStack {
                                    Text(user.name)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                }
                            }
                    }
                }
                .padding()
            }
        }
    }
    
}



struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
