//
//  FloatingFilterButton.swift
//  PokedexSwifttUI (iOS)
//
//  Created by Oscar Rodriguez Garrucho on 23/11/20.
//

import SwiftUI

struct ActionButton: View {
    var imageName: String
    var height: CGFloat = 24
    var width: CGFloat = 24
    var backgroundColor: Color = .purple
    @Binding var show: Bool

    var action: () -> Void

    var body: some View {
        Button(action: { action() }, label: {
            Image(imageName)
                .resizable()
                .frame(width: width, height: height)
                .padding(16)
        })
        .background(backgroundColor)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .black, radius: 30, x: 0.0, y: 0.0)
    }
}
