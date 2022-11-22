//
//  CustomButton.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation
import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.theme.blue)
            .foregroundColor(Color.white)
            .font(.headline)
            .cornerRadius(10)
    }
}
