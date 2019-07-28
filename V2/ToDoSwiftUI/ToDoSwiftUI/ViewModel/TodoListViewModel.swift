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

public class TodoListViewModel: BindableObject {
    public let willChange = PassthroughSubject<TodoListViewModel, Never>()
    
    var todos: Todos = [Todo]() {
        didSet {
            willChange.send(self)
        }
    }
    
    func shuffle() {
        self.todos = self.todos.shuffled()
    }
    
    func sort() {
        self.todos = self.todos.sorted(by: { ($0.pinned ?? false) && (!($1.pinned ?? false)) })
    }
    
    func markDone(id: Int) {
        self.todos.first(where: { $0.id == id })?.completed.toggle()
        self.willChange.send(self)
    }
    
    func pin(id: Int) {
        self.todos.first(where: { $0.id == id })?.pinned?.toggle()
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

