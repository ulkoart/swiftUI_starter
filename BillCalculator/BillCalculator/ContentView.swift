//
//  ContentView.swift
//  BillCalculator
//
//  Created by user on 23.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: String = ""
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentge: Int = 0
    
    let tipPercentges = [0,5,10,15,20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentges[tipPercentge])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amounPerPerson = grandTotal / peopleCount
        
        return amounPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amound", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Сколько чаевых вы хотите оставить")) {
                    Picker("Tip percent", selection: $tipPercentge) {
                        ForEach(0..<tipPercentges.count)  {
                            Text("\(self.tipPercentges[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section {
                    Text("\(self.totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Калькулятор счета", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
