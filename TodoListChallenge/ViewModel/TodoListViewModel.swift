//
//  TodoListViewModel.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 29/03/2021.
//  Copyright © 2021 Abdulelah Hajjar. All rights reserved.
//

import Foundation
import Combine

extension TodoListView {
    final class ViewModel: ObservableObject {
        private var todoRepository = TodoRepository.shared
        private var cancellables = Set<AnyCancellable>()

        @Published private(set) var unDoneTodos: [Todo] = []
        @Published private(set) var doneTodos: [Todo] = []
        
        init() {
            subscribeToStreams()
            print("init: TodoListViewModel")
        }
        
        deinit {
            print("deinit: TodoListViewModel")
        }
        
        func setTodoDone(todo: Todo, isDone: Bool) {
            todoRepository.setTodoDone(todo: todo, isDone: isDone)
        }
        
        private func subscribeToStreams() {
            todoRepository.$todos
                .receive(on: DispatchQueue.main)
                .map { $0.filter { !$0.isDone } }
                .assign(to: &$unDoneTodos)
            
            todoRepository.$todos
                .receive(on: DispatchQueue.main)
                .map { $0.filter { $0.isDone } }
                .assign(to: &$doneTodos)
        }
    }
}

