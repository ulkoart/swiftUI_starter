//
//  ContentView.swift
//  CustomTabBar
//
//  Created by user on 14.05.2021.
//  Copyright © 2021 ulkoart. All rights reserved.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
    }
}

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State private var showingSheet = false
    
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        
        VStack {
            ZStack {
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("First!")
                            .navigationBarTitle("First Tab")
                    }
                case 1:
                    ScrollView {
                        Text("TEST")
                    }
                default:
                    Text("Remaining tabs")
                }
            }
            
            Spacer()
            Divider()
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        selectedIndex = num
                        
                        if num == 2 {
                            showingSheet.toggle()
                        }
                        
                    }, label: {
                        Spacer()
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        Spacer()
                    }).sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
                    
                }
            }
        }
    }
}


//TabView {
//    Text("First")
//        .tabItem {
//            Image(systemName: "person")
//            Text("First")
//    }
//    Text("Second")
//        .tabItem {
//            Image(systemName: "gear")
//            Text("Second")
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
