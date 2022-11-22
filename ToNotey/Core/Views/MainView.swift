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
        VStack {
            HeaderView()
            
            ToDoView()
            
            Spacer()
            
            FooterView {
//                handle plus button tapped
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
