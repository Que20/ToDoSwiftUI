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
    @EnvironmentObject var viewModel: TodoListViewModel
    
    var body: some View {
        NavigationView {
            TodoList(todos: self.viewModel.todos, markDoneAction: {(id) in
                self.viewModel.markDone(id: id)
            }, pinAction: {(id) in
                self.viewModel.pin(id: id)
            })
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

#if DEBUG
let viewModel = TodoListViewModel()

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(viewModel)
    }
}
#endif
