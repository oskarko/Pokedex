//
//  NavigationLazyView.swift
//  PokedexSwifttUI (iOS)
//
//  Created by Oscar Rodriguez Garrucho on 23/11/20.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
