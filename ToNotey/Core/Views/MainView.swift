//
//  MainView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private(set) var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            content
            
            if viewModel.shouldPresentToDoFactoryView {
                todoFactoryPopup
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(viewModel: .mock)
                
            MainView(viewModel: .mock)
                .preferredColorScheme(.dark)
        }
    }
}

extension MainView {
    
    private var content: some View {
        VStack {
            HeaderView(currentContentType: $viewModel.currentContentType)
            
            switch viewModel.currentContentType {
            case .todo:
                ToDoView()
            case .notes:
                NotesView()
            case .folders:
                ToDoView()
            }
                        
            FooterView {
                viewModel.handleOnPlusButtonTapped()
            }
        }.navigationBarHidden(true)
        .background(
            Image(uiImage: .backgroundImage)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
        ).ignoresSafeArea(edges: .bottom)
    }
    
    private var todoFactoryPopup: some View {
        ZStack {
            Color.gray.blur(radius: 100, opaque: false)
                .onTapGesture {
                    viewModel.shouldPresentToDoFactoryView = false
                }
            
            ToDoFactoryView(
                viewModel: .init(
                    shouldKeepOnPresenting: $viewModel.shouldPresentToDoFactoryView
                )
            )
        }
    }
}
