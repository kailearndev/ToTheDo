//
//  ToTheDoApp.swift
//  ToTheDo
//
//  Created by kai on 5/8/24.
//

import SwiftUI
import SwiftData

@main
struct ToTheDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: ToDoItem.self)
        }
    }
}
