//
//  HeaderScreenTypeButton.swift
//  ToNotey
//
//  Created by Andrei Tanc on 21.11.2022.
//

import SwiftUI

struct HeaderScreenTypeButton: View {
    @Namespace private var namespace
    @Binding var isSelected: Bool
    @State var title: String = ""
    
    var handleOnTap: (() -> Void)?
    
    var body: some View {
        ZStack {

            if isSelected {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.theme.primary.opacity(0.8))
                    .matchedGeometryEffect(id: "HeaderScreenTypeButtonId", in: namespace)
                    .frame(width: 66, height: 3)
                    .offset(y: 15)
            }
            
            Button(title) {
                withAnimation(.spring()) {
                    isSelected = true
                    handleOnTap?()
                }
            }.foregroundColor(Color.theme.primary)
            .font(.title2.weight(.bold))
            .opacity(isSelected ? 1 : 0.5)
        }
        .frame(height: 50)
    }
}

struct HeaderScreenTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        HeaderScreenTypeButton(isSelected: .constant(false))
    }
}
