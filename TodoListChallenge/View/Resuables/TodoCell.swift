//
//  ContentView.swift
//  TodoListChallenge
//
//  Created by Abdulelah Hajjar on 11/05/2020.
//  Copyright © 2020 Abdulelah Hajjar. All rights reserved.
//

import SwiftUI

struct TodoCell: View {
	var todo: Todo
    var doneAction: (_ isDone: Bool) -> ()
    
    var body: some View {
		HStack(spacing: 8.0) {
			Image(systemName: "doc")
				.font(.system(size: 24))
				.frame(width: 48, height: 48)
				.foregroundColor(.white)
				.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
				.clipShape(Circle())
				.padding(8)
			
			
			VStack(alignment: .leading) {
				Text(todo.title)
					.font(.subheadline)
				Text(todo.detail)
					.font(.caption)
				Text(todo.date)
					.font(.caption)
			}
			
			Spacer()
			
			Button(action: {
				doneAction(true)
			}) {
				Image(systemName: "checkmark.circle")
					.foregroundColor(.green)
					.font(.system(size: 16))
//					.opacity(isDone ? 0 : 1)
			}
			.padding(8)
		}
		.frame(width: screen.width - 40, height: 80)
		.padding(8)
		.background(Color.white)
		.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
		.shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
		.shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoCell(todo: .init(title: "title", detail: "detail", date: Date().description), doneAction: { _ in })
    }
}
