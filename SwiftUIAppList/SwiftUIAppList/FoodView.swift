//
//  FoodView.swift
//  SwiftUIAppList
//
//  Created by user on 11.05.2021.
//  Copyright © 2021 ulkoart. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    var foodString: String = ""
    
    var body: some View {
        VStack {
            Text("🍓 - \(foodString)")
                .font(.largeTitle)
        }
        
        
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(foodString: "mock")
    }
}
