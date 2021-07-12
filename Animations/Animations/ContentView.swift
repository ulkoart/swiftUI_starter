//
//  ContentView.swift
//  Animations
//
//  Created by user on 12.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scale: CGFloat = 1
    
    @State private var angle: Double = 45
    @State private var borderThickness: CGFloat = 1
    
    var body: some View {
        VStack {
            Button(action: {
                self.scale += 1
            }) {
                Text("Tap me")
                    .scaleEffect(scale)
                    .animation(.easeIn)
            }
            
            Button(action: {
                self.angle += 45
                self.borderThickness += 1
            }) {
                Text("Tap me 2")
                    .padding()
                    .border(Color.red, width: borderThickness)
                    .rotationEffect(.degrees(angle))
                    // .animation(.easeIn)
                    .animation(.spring())
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
