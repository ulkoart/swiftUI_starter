//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by user on 23.05.2021.
//  Copyright © 2021 ulkoart. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Sweden", "Russia", "Greece", "Germany", "Canada", "Brazil", "Bangladesh", "Argentina"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Выбери флаг")
                        .foregroundColor(.white)
                        .font(.headline)
                    Text(self.countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) {number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .frame(width: 250, height: 125)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Общий счет: \(self.score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Общий счет: \(self.score)"), dismissButton: .default(Text("Продолжить")) {
                self.askQuestion()
                } )
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer =  Int.random(in: 0...2)
    }
    
    func flagTapped(_ number:Int) {
        if number == correctAnswer {
            scoreTitle = "Правильный ответ!"
            score += 1
        } else {
            scoreTitle = "Не правильно! Это флаг \(countries[number])"
            score -= 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
