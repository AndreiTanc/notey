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
    
    @State var shouldPresentToDo = true
    @State var shouldPresentNotes = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 60) {
            
            HeaderScreenTypeButton(isSelected: $shouldPresentToDo, title: ScreenType.toDo.rawValue) {
                shouldPresentNotes = false
            }
            
            HeaderScreenTypeButton(isSelected: $shouldPresentNotes, title: ScreenType.notes.rawValue) {
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
