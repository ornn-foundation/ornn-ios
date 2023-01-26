//
//  FloatingButtonModifier.swift
//  Ornn
//
//  Created by Naluebet Manpati on 25/1/2566 BE.
//

import SwiftUI

struct FloatingButtonModifier: ViewModifier {
    @State private var isLoaded = false
    @State private var isButton = false
    private let size: CGFloat = 60
    private let margin: CGFloat = 15

    private let icon: String
    private let color: Color
    private let action: () -> Void

    init(icon: String, color: Color, action: @escaping () -> Void) {
        self.icon = icon
        self.color = color
        self.action = action
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    FloatingButton()
                }
            }
        }.onAppear {
            isLoaded = true
            withAnimation {
                isButton = true
            }
        }
    }

    private func FloatingButton() -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 25))
                .foregroundColor(.white)
        }
        .frame(width: 60, height: 60)
        .background(color)
        .cornerRadius(30)
        .shadow(radius: 10)
        .offset(x: 0 - margin, y: isLoaded ? 0 - margin : 36)
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("1234")
        }.floatingButton(icon: "plus") {}
    }
}
