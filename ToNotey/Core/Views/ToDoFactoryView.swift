//
//  ToDoFactoryView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import SwiftUI

struct ToDoFactoryView: View {
    @ObservedObject private(set) var viewModel = ToDoFactoryViewModel()
    
    var body: some View {
        VStack {
            Text("Create new task")
                .foregroundColor(.theme.primary)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            titleTextField
            
            saveButton
        }.padding(.horizontal)
    }
}

struct ToDoFactoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToDoFactoryView(viewModel: .mock)
            
            ToDoFactoryView(viewModel: .mock)
                .preferredColorScheme(.dark)
        }
    }
}

extension ToDoFactoryView {
    var titleTextField: some View {
        TextField("What do you have to do?...", text: $viewModel.title)
            .foregroundColor(Color.theme.primary)
            .disableAutocorrection(true)
            .font(.callout)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.theme.secondary, lineWidth: 2)
            )
    }
    
    var saveButton: some View {
        Button("Save") {
//            viewModel.saveToDo()
        }.buttonStyle(CustomButton())
    }
}