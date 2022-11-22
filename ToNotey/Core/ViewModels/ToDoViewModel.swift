//
//  ToDoViewModel.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var allToDoItems: [ToDoItem] = [] {
        didSet {
            todayTodoItems = allToDoItems.filter { !$0.isDone }.filterForToday().sort(basedOn: .priority)
            previousTodoItems = allToDoItems.filter { !todayTodoItems.contains($0) }.filter{ !$0.isDone }.sort(basedOn: .date)
            doneTodoItems = allToDoItems.filter { $0.isDone }.sort(basedOn: .date)
        }
    }
    
    @Published var todayTodoItems: [ToDoItem] = []
    @Published var previousTodoItems: [ToDoItem] = []
    @Published var doneTodoItems: [ToDoItem] = []
    
    func handleOnAppear() {
        fetchAllToDos()
    }
    
    func fetchAllToDos() {
        allToDoItems = CoreDataManager.shared.fetchAll(ofType: ToDoItem.self)
    }
    
    func handleOnDelete(at offsets: IndexSet) {
//        if let index = offsets.first {
//            let item = todoItems[index]
//            allToDoItems.removeAll(where: { $0 == item })
//
//            CoreDataManager.shared.delete(todoItems[index], ofType: ToDoItem.self)
//        }
    }
}

extension ToDoViewModel {
    static var mock: ToDoViewModel {
        return .init()
    }
}
