//
//  ContentView.swift
//  ToTheDo
//
//  Created by kai on 5/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showCreate = false
    @State private var updateTodo: ToDoItem?

    @Query private var items: [ToDoItem]
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) {
                    item in
                    HStack {
                        VStack(alignment: .leading) {
                            if(item.isCritial) {
                             Text("🔥🔥")
                            }
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))").font(.callout)
                        }
                        Spacer()
                        Button{
                            withAnimation{
                                item.isCompleted.toggle()
                            }
                        }
                            label:
                        {
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .foregroundColor(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }
                    }
                    
                    .swipeActions{
                        //swpie del
                        Button( role: .destructive) {
                            withAnimation {
                                context.delete(item)
                            }
                        } label: {
                            Label("Remove", systemImage: "trash").symbolVariant(.fill)
                        }
                        
                        //swpie update
                        
                        Button () {
                            updateTodo = item
                        } label: {
                        Label ("Update", systemImage: "pencil")
                       
                        }.tint(.yellow)
                    }
                }
            }
            .navigationTitle("List🐶")
            Text("Hi Bitch")
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            showCreate.toggle()
                        }, label: {
                            Label("Add", systemImage: "plus")
                        })
                    }
                }
                .sheet(isPresented: $showCreate, content: {
                    NavigationStack {
                        CreateTodo().presentationDetents([.medium])
                    }
                }
                
                )
                .sheet(item: $updateTodo) {
                    updateTodo = nil
                }content : {
                    item in UpdateTodo(item: item)
                }
        }
       
      
        
    }
        
        
    
}

#Preview {
    ContentView()
}
