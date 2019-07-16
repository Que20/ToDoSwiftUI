//
//  List.swift
//  ToDoSwiftUI
//
//  Created by Kevin Maarek on 16/06/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import Foundation
import SwiftUI

struct TodoList : View {
    var todos: Todos
    var markDoneAction: ((_ id: Int) -> Void)
    var pinAction: ((_ id: Int) -> Void)
    
    var body: some View {
        List(self.todos) { todo in
            TodoCell(todoCellViewModel: TodoCellViewModel(todo: todo), markDoneAction: { (id) in
                self.markDoneAction(id)
            }) { (id) in
                self.pinAction(id)
            }
        }
    }
}

#if DEBUG
let todos = [Todo(userID: 0, id: 0, title: "Note", completed: true, pinned: true)]

struct TodoList_Previews : PreviewProvider {
    static var previews: some View {
        TodoList(todos: todos, markDoneAction: { (id) in
            print("done")
        }, pinAction: { (id) in
            print("pin")
        })
    }
}
#endif
