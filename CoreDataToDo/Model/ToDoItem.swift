//
//  ToDoItem.swift
//  CoreDataToDo
//
//  Created by Selcuk on 18.09.2020.
//  Copyright © 2020 Selcuk. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    
    @NSManaged public var createAt:Date?
    @NSManaged public var title:String?
    
}
extension ToDoItem {
    
    static func getAllToDoItem() -> NSFetchRequest<ToDoItem>{
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as!
        NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
    
}
