//
//  FooterView.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import SwiftUI

struct FooterView: View {
    var iconName: String = "plus"
    
    var handleOnPlusButtonTap: (() -> Void)?
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Spacer()
            
            Text("10 to dos")
                .font(.callout)
                .foregroundColor(.theme.primary.opacity(0.5))
            
            Spacer()
            Image(systemName: iconName)
                .font(.headline)
                .foregroundColor(Color.white)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .foregroundColor(Color.theme.blue)
                )
                .padding()
                .onTapGesture {
                    handleOnPlusButtonTap?()
                }
        }
        .background(
            Image(uiImage: .coverImage)
                .resizable()
        )
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FooterView()
            
            FooterView()
                .preferredColorScheme(.dark)
        }
    }
}
