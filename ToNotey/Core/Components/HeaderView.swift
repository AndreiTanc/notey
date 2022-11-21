//
//  HeaderView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import SwiftUI

enum ScreenType: String {
    case toDo = "To Do"
    case notes = "Notes"
    case folders = "Folders"
}

struct HeaderView: View {
    var shouldDisplayFoldersBeforeNotes: Bool {
        get {
            UserDefaults.standard.bool(forKey: "shouldDisplayFoldersBeforeNotes")
        }
    }
    
    var secondScreenType: ScreenType {
        get {
            shouldDisplayFoldersBeforeNotes ? .folders : .notes
        }
    }
    
    @State var shouldPresentToDo = true
    @State var shouldPresentNotes = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 60) {
            
            HeaderScreenTypeButton(isSelected: $shouldPresentToDo, title: ScreenType.toDo.rawValue) {
                shouldPresentNotes = false
            }
            
            HeaderScreenTypeButton(isSelected: $shouldPresentNotes, title: secondScreenType.rawValue) {
                shouldPresentToDo = false
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
