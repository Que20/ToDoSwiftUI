//
//  TodoModel.swift
//  ToDoSwiftUI
//
//  Created by Kevin Maarek on 13/06/2019.
//  Copyright © 2019 Kevin Maarek. All rights reserved.
//

import Foundation
import SwiftUI

public class Todo: Codable, Identifiable {
    
    public let userID: Int
    public let id: Int
    public var title: String
    public var completed: Bool
    public var pinned: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
        case pinned = "pinned"
    }
    
    public init(userID: Int, id: Int, title: String, completed: Bool, pinned: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
        self.pinned = pinned
    }
    
    public init() {
        self.userID = 0
        self.id = 0
        self.title = ""
        self.completed = false
        self.pinned = false
    }
}

public typealias Todos = [Todo]
