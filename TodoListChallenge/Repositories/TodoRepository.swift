//
//  TodoStore.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 11/05/2020.
//  Copyright © 2020 Abdulelah Hajjar. All rights reserved.
//

import SwiftUI
import Combine

final class TodoRepository: ObservableObject {
    static let shared = TodoRepository()
    
	@Published var todos = [Todo(title: "Shopping", detail: "Cheese, Cola and Fries", date: "\(Date())"),
							Todo(title: "Playing", detail: "CoD: MW", date: "\(Date())"),
							Todo(title: "Fasting", detail: "Ramadan", date: "\(Date())"),
							Todo(title: "Buying", detail: "Amazon", date: "\(Date())"),
							Todo(title: "Eating", detail: "Dinner", date: "\(Date())"),
							Todo(title: "Homework", detail: "CHEM101", date: "\(Date())"),
							Todo(title: "Major 1", detail: "Math 101", date: "\(Date())"),
							Todo(title: "Pray", detail: "All prayers", date: "\(Date())"),
							Todo(title: "Eat Healthy", detail: "Today chicken", date: "\(Date())")]
    
    func addTodo(todo: Todo) {
        DispatchQueue.main.async { [weak self] in
            var todosCopy = self?.todos
            todosCopy?.append(todo)
            self?.todos = todosCopy ?? []
        }
    }
    
    func setTodoDone(todo: Todo, isDone: Bool) {
        guard let todoIndex = todos.firstIndex(of: todo) else { return }
        DispatchQueue.main.async { [weak self] in
            self?.todos[todoIndex].isDone = isDone
        }
    }
}
