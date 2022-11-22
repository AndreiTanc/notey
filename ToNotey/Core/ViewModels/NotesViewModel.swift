//
//  NotesViewModel.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation

class NotesViewModel: ObservableObject {
    
    func handleOnAppear() {
        
    }
}

extension NotesViewModel {
    static var mock: NotesViewModel {
        return .init()
    }
}
