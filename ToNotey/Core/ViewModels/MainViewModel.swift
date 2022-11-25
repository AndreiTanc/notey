//
//  MainViewModel.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import Foundation

enum ContentType {
    case todo
    case notes
    case folders
}

class MainViewModel: ObservableObject {
    @Published var currentContentType: ContentType = .todo
    
    @Published var shouldPresentToDoFactoryView: Bool = false
    
    func handleOnPlusButtonTapped() {
        if currentContentType == .todo {
            shouldPresentToDoFactoryView = true
        }
    }
}

extension MainViewModel {
    static var mock: MainViewModel {
        return .init()
    }
}
