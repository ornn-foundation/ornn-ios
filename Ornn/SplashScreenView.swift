//
//  SplashScreenView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.75
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            TabBarView()
        } else {
            splashView
        }
    }

    var splashView: some View {
        VStack {
            VStack {
                Image(systemName: "backpack.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue.opacity(0.7))
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    size = 0.9
                    opacity = 1.0
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
