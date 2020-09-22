//
//  ContentView.swift
//  CoreDataToDo
//
//  Created by Selcuk on 18.09.2020.
//  Copyright © 2020 Selcuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItem()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    private var validated: Bool {       // check for the textfield validation
        !newTodoItem.isEmpty
    }
    
    var body: some View {
        NavigationView{
            
            List{
                Section(header: Text("What is next ?")){
                    HStack{
                        TextField("New Item", text: self.$newTodoItem)
                        // İf textfield is empty plus circle will not be shown.
                        // User can not add empty string ToDo's
                        if validated{
                            
                            Button(action: {
                                let toDoItem = ToDoItem(context: self.managedObjectContext)
                                toDoItem.title = self.newTodoItem
                                toDoItem.createAt =  Date()
                                
                                do{
                                    try self.managedObjectContext.save()
                                }catch{
                                    print(error)
                                }
                                self.newTodoItem = ""
                                
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                        }
                    }
                }.font(.headline)
                
                Section(header: Text("To Do")){
                    ForEach(self.toDoItems){ todoItem in
                        ToDoItemView(title: todoItem.title!, createAt: "\(todoItem.createAt!)")
                    }.onDelete {indexSet in
                    
                        let deleteItem = self.toDoItems[indexSet.first!]
                       
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                        
                    }
                }
            }
            .navigationBarTitle(Text("My list"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}




