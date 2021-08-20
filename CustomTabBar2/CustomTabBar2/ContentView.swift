//
//  ContentView.swift
//  CustomTabBar2
//
//  Created by user on 20.08.2021.
//

import SwiftUI

struct ContentView: View {
     @State var selected = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Button(action: {
                        self.selected = 0
                    }) {
                        Image("home").resizable().frame(width: 24, height: 24)
                    }.foregroundColor(self.selected == 0 ? .black : .gray)
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image("search").resizable().frame(width: 24, height: 24)
                    }.foregroundColor(self.selected == 1 ? .black : .gray)
                    Spacer().frame(width: 120)
                    
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image("person").resizable().frame(width: 24, height: 24)
                    }.foregroundColor(self.selected == 2 ? .black : .gray)
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 3
                    }) {
                        Image("menu").resizable().frame(width: 24, height:24)
                    }.foregroundColor(self.selected == 3 ? .black : .gray)
                    Spacer(minLength: 12)
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedShape())
                
                Button(action: {}) {
                    Image("heart")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(18)
                        
                }.background(Color.yellow)
                .clipShape(Circle())
                .offset(y: -32)
                .shadow(radius: 5)
            }
        }.background(Color("Color").edgesIgnoringSafeArea(.top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CurvedShape: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 55), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: 55))
        }
        .fill(Color.white)
        .rotationEffect(.init(degrees: 180))
    }
}
