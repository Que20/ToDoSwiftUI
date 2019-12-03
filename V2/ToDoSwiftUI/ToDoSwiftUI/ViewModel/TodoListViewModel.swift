//
//  TodoViewModel.swift
//  ToDoSwiftUI
//
//  Created by Kevin Maarek on 13/06/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class TodoListViewModel: ObservableObject {
    
    @Published var todos: Todos = [Todo]()
    
    func shuffle() {
        self.todos = self.todos.shuffled()
    }
    
    func sort() {
        self.todos = self.todos.sorted(by: { ($0.pinned ?? false) && (!($1.pinned ?? false)) })
        self.objectWillChange.send()
    }
    
    func markDone(id: Int) {
        self.todos.first(where: { $0.id == id })?.completed.toggle()
        self.objectWillChange.send()
    }
    
    func pin(id: Int) {
        let item = self.todos.first(where: { $0.id == id })
        if let _ = item?.pinned {
            item?.pinned?.toggle()
        } else {
            item?.pinned = true
        }
        self.sort()
    }
    
    func load() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let todos = try JSONDecoder().decode(Todos.self, from: data)
                DispatchQueue.main.async {
                    self.todos = todos
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}

