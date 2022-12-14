//
//  ProfileView.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 02/09/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isShowingPhotoPicker = false
    @State private var profileImage = UIImage(named: "user")!
    
    var body: some View {
        ZStack {
            headerSection
            
            profileSection
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    //MARK: Header Section
    private var headerSection: some View {
        VStack {
            HStack {
                Image(systemName: "list.bullet")
                    .font(.title)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .font(.title)
                    .onTapGesture {
                        isShowingPhotoPicker = true
                    }
            }
            .padding()
            Spacer()
                .sheet(isPresented: $isShowingPhotoPicker) {
                    PhotoPicker(profileImage: $profileImage)
                }
        }
        
    }
    
    //MARK: Profile Section
    private var profileSection: some View {
        VStack {
            Image(uiImage: profileImage)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
                .onTapGesture {
                    isShowingPhotoPicker = true
                }
            
            VStack {
                Text("Adarsh Shukla")
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                Text("I am an iOS Development enthusiast exploring oppertunities to learn and grow. I am very eager to learn latest and greatest features of iOS Development.")
                    .foregroundColor(.gray)
                    .font(.body)
                    .fontWeight(.semibold)
            }
            .frame(alignment: .center)
            .padding()
            
        }
        
    }
}

