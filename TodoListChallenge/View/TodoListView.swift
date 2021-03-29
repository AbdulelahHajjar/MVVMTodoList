//
//  TodoListView.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 11/05/2020.
//  Copyright © 2020 Abdulelah Hajjar. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: ViewModel = .init()
    @State var showAddTodoView = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    ForEach(viewModel.unDoneTodos) { todo in
                        TodoCell(todo: todo) { isDone in
                            viewModel.setTodoDone(todo: todo, isDone: isDone)
                        }
                    }
                    
                    if viewModel.doneTodos.count > 0 {
                        Text("Completed Todos")
                            .padding(.top, 30)
                        
                        ForEach(viewModel.doneTodos) { todo in
                            TodoCell(todo: todo) { isDone in
                                viewModel.setTodoDone(todo: todo, isDone: isDone)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .toolbar {
                    Button(action: { showAddTodoView = true }) {
                        Text("Add Todo")
                    }
                }
                .navigationTitle("Your Todos!")
            }
            .sheet(isPresented: $showAddTodoView) {
                AddTodoView()
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}

let screen = UIScreen.main.bounds
