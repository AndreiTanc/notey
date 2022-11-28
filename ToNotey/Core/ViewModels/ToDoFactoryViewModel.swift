//
//  ToDoFactoryViewModel.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation
import SwiftUI

class ToDoFactoryViewModel: ObservableObject {
    @Binding var shouldKeepOnPresenting: Bool
    
    @Published var title: String = ""
    @Published var isHighPriority: Bool = false
    @Published var details: String = ""
    
    @Published var shouldShowAdditionalInfo: Bool = false {
        didSet {
            additionalInfoText = shouldShowAdditionalInfo ? "Hide additional info" : "Show additional info"
            additionalInfoImageName = shouldShowAdditionalInfo ? "chevron.up" : "chevron.down"
        }
    }
    
    var additionalInfoText: String = "Show additional info"
    var additionalInfoImageName: String = "chevron.down"
    
    var audioRecordingManager = AudioRecordingManager()
    
    init(shouldKeepOnPresenting: Binding<Bool>) {
        self._shouldKeepOnPresenting = shouldKeepOnPresenting
    }
    
    func saveToDo() {
        var todoDict: [String: Any] = [KeyConstants.ToDo.title.rawValue: title,
                                      KeyConstants.ToDo.isHighPriority.rawValue: isHighPriority]
        
        if !details.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            todoDict[KeyConstants.ToDo.details.rawValue] = details
        }
        
        CoreDataManager.shared.insertItem(
            ofType: ToDoItem.self,
            withData: todoDict
        )
        
        shouldKeepOnPresenting = false
    }
    
    func handleOnRecordButtonPressed() {
        if audioRecordingManager.recording {
            audioRecordingManager.stopRecording()
        } else {
            audioRecordingManager.startRecording()
        }
    }
}

extension ToDoFactoryViewModel {
    static var mock: ToDoFactoryViewModel {
        return .init(shouldKeepOnPresenting: .constant(true))
    }
}
