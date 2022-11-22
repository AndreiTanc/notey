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
            Text("Main")
            
            ToDoView()
            
            Spacer()
        }.navigationBarHidden(true)
        .background(
            Image(uiImage: .backgroundImage)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: .mock)
    }
}
