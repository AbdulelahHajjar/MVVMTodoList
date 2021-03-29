//
//  AddTodoView.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 11/05/2020.
//  Copyright © 2020 Abdulelah Hajjar. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ViewModel = .init()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $viewModel.title)
                    TextField("Detail", text: $viewModel.detail)
                    DatePicker("Date", selection: $viewModel.date)
                }
                
                Section {
                    Button("Add Todo", action: addTodo)
                }
            }
            .navigationTitle("Add Todo")
        }
    }
    
    func addTodo() {
        presentationMode.wrappedValue.dismiss()
        viewModel.addTodo()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
		AddTodoView()
    }
}
