//
//  ContentView.swift
//  MyCard
//
//  Created by Artem Ulko on 31.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.10, green: 0.74, blue: 0.61).ignoresSafeArea()
            VStack {
                Image("foto").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 150, height: 150).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/.stroke(lineWidth: 5.0))
                Text("Артем Улько")
                    .font(.title2)
                    .fontWeight(.heavy)
                Text("iOS / Python Developer")
                    .font(.headline)
                    .fontWeight(.light)
                Divider()
                Card(image: "phone.fill", message: "+79034517098")
                Card(image: "envelope.fill", message: "ulkoart@gmail.com")
            }.foregroundColor(.white)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Card: View {
    let image: String
    let message: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25).padding(.horizontal).frame(height: 50.0).overlay(HStack {
            Image(systemName: image)
            Text(message)
                .fontWeight(.semibold)
        }.foregroundColor(Color(red: 0.10, green: 0.74, blue: 0.61)))
    }
}
