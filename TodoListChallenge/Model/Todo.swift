//
//  Todo.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 29/03/2021.
//  Copyright © 2021 Abdulelah Hajjar. All rights reserved.
//

import Foundation


struct Todo: Identifiable, Hashable {
    var id = UUID()
    
    var title: String
    var detail: String
    var date: String
    var isDone: Bool = false
}
