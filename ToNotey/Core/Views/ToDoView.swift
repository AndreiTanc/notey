//
//  ToDoView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import SwiftUI

struct ToDoView: View {
    @ObservedObject private(set) var viewModel = ToDoViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            toDosView
            
            if !viewModel.doneTodoItems.isEmpty {
                doneToDosView
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 30)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToDoView(viewModel: .mock)

            ToDoView(viewModel: .mock)
                .preferredColorScheme(.dark)
        }
    }
}

extension ToDoView {
    private var toDosView: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if viewModel.todayTodoItems.isEmpty &&
                    viewModel.previousTodoItems.isEmpty {
                    
                    Text("No more tasks for you!!!")
                }
                
                if !viewModel.todayTodoItems.isEmpty {
                    todaysToDos
                }
                
                if !viewModel.previousTodoItems.isEmpty {
                    previousToDos
                }
            }.padding()
        }
        .background(
            Image(uiImage: .coverImage)
                .resizable()
        )
        .cornerRadius(20)
    }
    
    private var todaysToDos: some View {
        VStack {
            ToDoListSectionHeader(title: "Today:")
            
            ForEach($viewModel.todayTodoItems) { $item in
                ToDoRow(toDoItem: $item, onItemChange: {
                    withAnimation(.spring()) {
                        viewModel.fetchAllToDos()
                    }
                })
            }
            .onDelete(perform: viewModel.handleOnDelete(at:))
        }
    }
    
    private var previousToDos: some View {
        VStack {
            ToDoListSectionHeader(title: "Previous Days:")
            
            ForEach($viewModel.previousTodoItems) { $item in
                ToDoRow(toDoItem: $item, onItemChange: {
                    withAnimation(.spring()) {
                        viewModel.fetchAllToDos()
                    }
                })
            }
            .onDelete(perform: viewModel.handleOnDelete(at:))
        }
    }
    
    private var doneToDosView: some View {
        VStack(alignment: .leading) {
            Text("You have completed \(viewModel.doneTodoItems.count) tasks today")
                .foregroundColor(.theme.secondary)

            Divider()
                .padding(.trailing, 30)
                .offset(y: -5)
            
            ToDoRow(toDoItem: $viewModel.doneTodoItems[0], onDoneItemChange: {
                withAnimation(.spring()) {
                    viewModel.fetchAllToDos()
                }
            })
        }
        .padding()
        .background(
            Image(uiImage: .coverImage)
                .resizable()
        )
        .cornerRadius(20)
    }
}
