//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Kevin Maarek on 13/06/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    @EnvironmentObject var viewModel: TodoViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.todos) { todo in
                NavigationButton(destination: TodoView(todo: todo)) {
                    TodoCell(todo: todo)
                }
                }
                .navigationBarTitle(Text("Todo"))
                .navigationBarItems(leading:
                    Button(action: {
                        self.viewModel.shuffle()
                    }, label: {
                        Text("Shuffle")
                    }),
                                    trailing:
                    Button(action: {
                        self.viewModel.load()
                    }, label: {
                        Image(systemName: "arrow.2.circlepath")
                    })
            )
        }
    }
}

struct TodoView : View {
    var todo: Todo
    
    var body: some View {
        Text(todo.title)
    }
}

struct TodoCell : View {
    var todo: Todo
    var body: some View {
        HStack {
            if todo.completed {
                Image(systemName: "checkmark.square")
            } else {
                Image(systemName: "square")
            }
            Text(todo.title)
        }
    }
}
