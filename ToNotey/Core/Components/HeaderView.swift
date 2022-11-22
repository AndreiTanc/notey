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
}

struct HeaderView: View {
    @Binding var currentContentType: ContentType
    
    @State var shouldPresentToDo = true
    @State var shouldPresentNotes = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 60) {
            
            HeaderScreenTypeButton(isSelected: $shouldPresentToDo, title: ScreenType.toDo.rawValue) {
                currentContentType = .todo
                shouldPresentNotes = false
            }
            
            HeaderScreenTypeButton(isSelected: $shouldPresentNotes, title: ScreenType.notes.rawValue) {
                currentContentType = .notes
                shouldPresentToDo = false
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(currentContentType: .constant(.todo))
            
            HeaderView(currentContentType: .constant(.todo))
                .preferredColorScheme(.dark)
        }
    }
}
