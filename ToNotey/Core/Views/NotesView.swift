//
//  NotesView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject private(set) var viewModel = NotesViewModel()
    
    var body: some View {
        notesListView
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(uiImage: .coverImage)
                    .resizable()
            )
            .cornerRadius(20)
            .padding(.horizontal, 30)
            .onAppear(perform: viewModel.handleOnAppear)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

extension NotesView {
    private var notesListView: some View {
        VStack {
            
            
            
        }
    }
}
