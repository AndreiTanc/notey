//
//  ToDoFactoryViewModel.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation

class ToDoFactoryViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var isHighPriority: Bool = false
    
    func saveToDo() {
        CoreDataManager.shared.insertItem(
            ofType: ToDoItem.self,
            withData: [KeyConstants.ToDo.title.rawValue: title,
                       KeyConstants.ToDo.isHighPriority.rawValue: isHighPriority]
        )
        
        Router.shared.popViewController()
    }
}

extension ToDoFactoryViewModel {
    static var mock: ToDoFactoryViewModel {
        return .init()
    }
}
