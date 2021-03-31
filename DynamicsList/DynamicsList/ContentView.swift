//
//  ContentView.swift
//  DynamicsList
//
//  Created by user on 24.03.2021.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    let username: String
    let message: String
    let imageName: String
}

struct ContentView: View {
        
    let users: [User] = [
        .init(id: 1, username: "Navalny Alex", message: "Hi all🙂", imageName: "Navalny"),
        .init(id: 2, username: "Putin Vladimir", message: "Got out of here quickly😡", imageName: "Putin"),
        .init(id: 3, username: "Sobchak Ksenya", message: "Сalm down, i'm in charge here😄 wow wow wow...girl power", imageName: "Sobchak")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(users, id: \.id) {user in
                    //users row
                    UserRow(user: user)
                }
            }.navigationBarTitle("Dynamic List")
        }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
//                            .clipped()
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top: 8, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 1st
 
 List (users) {
     Text($0.username)
 }.navigationBarTitle("Dynamic List")
 
 
 
 
 */
