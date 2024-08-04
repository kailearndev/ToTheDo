//
//  CreateTodo.swift
//  ToTheDo
//
//  Created by kai on 5/8/24.
//

import SwiftUI

struct CreateTodo: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @State private var item = ToDoItem()
   
    var body: some View {
        List {
            
            TextField("Name", text: $item.title)
            DatePicker("Choose a date", selection: $item.timestamp)
            Toggle("Important ?", isOn: $item.isCritial)
            Button("Create") {
                withAnimation{
                    context.insert(item)
                }
                dismiss()
            }
        }
        .navigationTitle("Create Todo")
    }
}

#Preview {
    CreateTodo()
}
