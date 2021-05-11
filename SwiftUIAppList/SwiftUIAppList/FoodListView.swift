//
//  FoodListView.swift
//  SwiftUIAppList
//
//  Created by user on 11.05.2021.
//  Copyright © 2021 ulkoart. All rights reserved.
//

import SwiftUI

protocol FoodListViewModelProtocol {
    var filterButtonName: String { get }
}

final class FoodListViewModel: ObservableObject, FoodListViewModelProtocol {
    
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [Food(name: "Strawberry", isFav: true),
                                         Food(name: "Cheese", isFav: false),
                                         Food(name: "Apple", isFav: true),
                                         Food(name: "Tomato", isFav: false)]
}

struct Food: Identifiable {
    let id = UUID()
    let name: String
    let isFav: Bool
}

struct FoodListView: View {
    
    @ObservedObject var viewModel = FoodListViewModel()
    
    @State var favesShowed: Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    FilterView(favesShowed: $favesShowed).environmentObject(viewModel)
                    ForEach(viewModel.foods) { food in
                        if !self.favesShowed || food.isFav {
                            NavigationLink(destination: FoodView(foodString: food.name)) {
                                Text(food.name)
                            }
                        }
                    } // ForEach
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Foods")
        }

    }
}

// MARK: - Views

struct FilterView: View {
    
    @Binding var favesShowed: Bool
    
    @EnvironmentObject var viewModel: FoodListViewModel
    
    var body: some View {
        Toggle(isOn: $favesShowed) {
            Text(viewModel.filterButtonName)
        }
    }
    
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView()
    }
}
