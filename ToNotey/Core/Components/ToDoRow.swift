//
//  ToDoRow.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import SwiftUI

fileprivate let kDoneToDoImageName = "doneToDo"
fileprivate let kNotDoneToDoImageName = "notDoneToDo"
fileprivate let kHighPrioImageName = "highPrio"

struct ToDoRow: View {
    @Binding var toDoItem: ToDoItem
    
    var onItemChange: (() -> Void)?
    var onDoneItemChange: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            if !toDoItem.isDone {
                Image(kHighPrioImageName)
                    .opacity(toDoItem.isHighPriority ? 1 : 0)
                    .padding(.top, 3)
            }
            
            VStack(alignment: .leading) {
                Text(toDoItem.title)
                    .foregroundColor(toDoItem.isDone ? .theme.secondary : .theme.primary)
                    .strikethrough(toDoItem.isDone)
                
                if let details = toDoItem.details, !toDoItem.isDone {
                    Text(details)
                        .foregroundColor(.theme.secondary)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            Image(toDoItem.isDone ? kDoneToDoImageName : kNotDoneToDoImageName)
                .onTapGesture(perform: handleOnTapGesture)
                .padding(.top, 3)
        }
    }
    
    private func handleOnTapGesture() {
        let wasDone = toDoItem.isDone
        defer {
            _ = wasDone ? onDoneItemChange?() : onItemChange?()
        }
        
        toDoItem.isDone.toggle()
        toDoItem.completingDate = toDoItem.isDone ? Date() : nil
        CoreDataManager.shared.saveContext()
    }
}

struct ToDoRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRow(toDoItem: .constant(.init()))
    }
}
