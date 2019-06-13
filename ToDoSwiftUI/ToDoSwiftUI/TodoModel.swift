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
    public let title: String
    public let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    
    public init(userID: Int, id: Int, title: String, completed: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
    }
}

public typealias Todos = [Todo]
