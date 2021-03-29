//
//  AddTodoViewModel.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 29/03/2021.
//  Copyright © 2021 Abdulelah Hajjar. All rights reserved.
//

import Foundation

extension AddTodoView {
    final class ViewModel: ObservableObject {
        private var todoRepository = TodoRepository.shared
        
        @Published var title: String = ""
        @Published var detail: String = ""
        @Published var date: Date = Date()
        
        
        init() {
            print("init: AddTodoViewModel")
        }
        
        deinit {
            print("deinit: AddTodoViewModel")
        }
        
        func addTodo() {
            todoRepository.addTodo(todo: .init(title: title, detail: detail, date: date.description))
        }
    }
}
