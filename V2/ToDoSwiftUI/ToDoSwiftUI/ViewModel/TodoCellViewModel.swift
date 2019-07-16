//
//  TodoCellViewModel.swift
//  ToDoSwiftUI
//
//  Created by Kevin Maarek on 16/06/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import Foundation

public class TodoCellViewModel {
    
    private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
    public func isPinned() -> Bool {
        return self.todo.pinned ?? false
    }
    
    public func isComleted() -> Bool {
        return self.todo.completed
    }
    
    public func getTitle() -> String {
        return self.todo.title
    }
    
    public func getId() -> Int {
        return self.todo.id
    }
}
