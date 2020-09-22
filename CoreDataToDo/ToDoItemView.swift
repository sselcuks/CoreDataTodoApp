//
//  ToDoItemView.swift
//  CoreDataToDo
//
//  Created by Selcuk on 21.09.2020.
//  Copyright © 2020 Selcuk. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title: String = ""
    var createAt: String = ""
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createAt)
                    .font(.caption)
            }
        }
        
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
