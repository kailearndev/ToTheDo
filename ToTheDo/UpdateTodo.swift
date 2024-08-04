//
//  UpdateTodo.swift
//  ToTheDo
//
//  Created by kai on 5/8/24.
//

import SwiftUI
import SwiftData
struct UpdateTodo: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var item: ToDoItem
    
    var body: some View {
        List {
            TextField("name", text:$item.title)
            DatePicker("Choose a date",
                       selection: $item.timestamp
            )
            Toggle("Important ?", isOn: $item.isCritial)
            Button ("Update") {
                dismiss()
            }
        }.navigationTitle("Update 💦")
    }
}

