//
//  Order.swift
//  CoreDataWithout
//
//  Created by user on 05.05.2021.
//

import Foundation
import CoreData

public class Order: NSManagedObject, Identifiable {
    @NSManaged public var drink: String
    @NSManaged public var createdAt: Date
}

extension Order {
    static func getAllOrders() -> NSFetchRequest<Order> {
        let request: NSFetchRequest<Order> = Order.fetchRequest() as! NSFetchRequest<Order>
        
        let sortDescriptor = NSSortDescriptor(key: "drink", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }
}
