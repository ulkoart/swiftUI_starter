//
//  ContentView.swift
//  CoreDataWithout
//
//  Created by user on 05.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(entity: Order.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Order.drink, ascending: true)]) var orders: FetchedResults<Order>
    @FetchRequest(fetchRequest: Order.getAllOrders()) var orders: FetchedResults<Order>
    
    @State private var newOrder = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New Order")) {
                    HStack {
                        TextField("New order", text: $newOrder)
                        Button(action: {
                            let order = Order(context: self.managedObjectContext)
                            order.drink = self.newOrder
                            order.createdAt = Date()
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                fatalError("save error")
                            }
                            self.newOrder = ""
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                }
                Section(header: Text("Your Orders")) {
                    ForEach(self.orders, id: \.self) { order in
                        OrderItemView(drink: order.drink , createdAt: String(describing: order.createdAt))
                    }.onDelete(perform: removerOrder)
                }
            }.navigationBarTitle(Text("Order View"))
            .navigationBarItems(trailing: EditButton())
            
        }
    }
    
    func removerOrder(at offset: IndexSet) {
        for index in offset {
            let man = orders[index]
            managedObjectContext.delete(man)
            do {
                try self.managedObjectContext.save()
            } catch {
                fatalError()
            }
        }
    }
}

struct OrderItemView: View {
    var drink: String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(drink).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
