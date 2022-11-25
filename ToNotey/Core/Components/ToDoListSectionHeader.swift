//
//  ToDoListSectionHeader.swift
//  ToNotey
//
//  Created by Andrei Tanc on 23.11.2022.
//

import SwiftUI

struct ToDoListSectionHeader: View {
    var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.theme.primary)
                .font(.title2)
                .fontWeight(.semibold)
            
            Divider()
                .padding(.trailing, 30)
                .offset(y: -5)
        }
    }
}

struct ToDoSection_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListSectionHeader()
    }
}
