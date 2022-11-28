//
//  ToDoFactoryView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import SwiftUI

struct ToDoFactoryView: View {
    @ObservedObject private(set) var viewModel: ToDoFactoryViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Create new task")
                .foregroundColor(.theme.primary)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            titleTextField
            highPriorityView
            
            showAdditionalInfoView
            
            if viewModel.shouldShowAdditionalInfo {
                detailsView
                recordingButton
            }
            
            saveButton
        }.padding().background(Color.theme.primaryInversed).cornerRadius(15).padding(.horizontal)
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
    private var titleTextField: some View {
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
    
    private var highPriorityView: some View {
        Toggle("Is it high priority?", isOn: $viewModel.isHighPriority)
            .tint(Color.theme.blue)
            .foregroundColor(Color.theme.primary)
            .font(.callout)
            .padding(.leading, 3)
    }
    
    private var showAdditionalInfoView: some View {
        HStack {
            Spacer()
            Text(viewModel.additionalInfoText)
                .foregroundColor(Color.theme.primary)
                .font(.caption)

            Image(systemName: viewModel.additionalInfoImageName)
        }.padding(.horizontal)
        .onTapGesture {
            withAnimation {
                viewModel.shouldShowAdditionalInfo.toggle()
            }
        }
    }
    
    private var detailsView: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $viewModel.details).autocorrectionDisabled().frame(height: 100)
            Text(viewModel.details).opacity(0)
            
            if viewModel.details.isEmpty {
                Text("Details for task...")
                    .foregroundColor(.theme.secondary)
                    .padding(.top, 10).padding(.leading, 5)
            }
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.theme.secondary, lineWidth: 2)
        )
    }
    
    private var recordingButton: some View {
        Button("Recording button") {
            viewModel.handleOnRecordButtonPressed()
        }
    }
    
    private var saveButton: some View {
        Button("Save") {
            viewModel.saveToDo()
        }.buttonStyle(CustomButton())
    }
}
