//
//  View+Extension.swift
//  Ornn
//
//  Created by Naluebet Manpati on 25/1/2566 BE.
//

import SwiftUI

extension View {
    func hideTabBar(isTabBar: Binding<Bool>, animation: Bool = false) -> some View {
        onAppear {
            if animation {
                withAnimation {
                    isTabBar.wrappedValue = false
                }
            } else {
                isTabBar.wrappedValue = false
            }
        }
    }

    func showTabBar(isTabBar: Binding<Bool>, animation: Bool = false) -> some View {
        return toolbar(isTabBar.wrappedValue ? .visible : .hidden, for: .tabBar)
            .onAppear {
                if animation {
                    withAnimation {
                        isTabBar.wrappedValue = true
                    }
                } else {
                    isTabBar.wrappedValue = true
                }
            }
    }

    func floatingButton(
        icon: String,
        color: Color = .blue,
        action: @escaping () -> Void
    ) -> some View {
        modifier(FloatingButtonModifier(
            icon: icon,
            color: color,
            action: action
        ))
    }
}
