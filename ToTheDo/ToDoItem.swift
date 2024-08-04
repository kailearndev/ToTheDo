//
//  ToDoItem.swift
//  ToTheDo
//
//  Created by kai on 5/8/24.
//

import Foundation
import SwiftData

@Model
final class ToDoItem {
    var title: String
    var timestamp: Date
    var isCritial: Bool
    var isCompleted: Bool
    init(title: String = "",
         timestamp: Date = .now,
         isCritial: Bool = false,
         isCompleted: Bool = false)
    {
        self.title = title
        self.timestamp = timestamp
        self.isCritial = isCritial
        self.isCompleted = isCompleted
    }
    
    
}
