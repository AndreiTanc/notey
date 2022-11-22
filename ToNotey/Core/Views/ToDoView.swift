//
//  ToDoView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import SwiftUI

struct ToDoView: View {
    @ObservedObject private(set) var viewModel = ToDoViewModel()
    
    var body: some View {
        VStack {
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(uiImage: .coverImage)
                .resizable()
        )
        .cornerRadius(20)
        .padding(.horizontal, 30)
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToDoView(viewModel: .mock)

            ToDoView(viewModel: .mock)
                .preferredColorScheme(.dark)
        }
    }
}
