//
//  ToDoFactoryViewModel.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation

class ToDoFactoryViewModel: ObservableObject {
    @Published var title: String = ""
    
}

extension ToDoFactoryViewModel {
    static var mock: ToDoFactoryViewModel {
        return .init()
    }
}
