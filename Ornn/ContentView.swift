//
//  ContentView.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            Button("Show Touch ID alert") {
                self.showAlert = true
            }
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
//        .onAppear(perform: authenticate)
        .alert(isPresented: $showAlert) {
            alertView()
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {}
    }

    func alertView() -> Alert {
        Alert(
            title: Text("Touch ID not available"),
            message: Text("Your device is not configured for Touch ID."),
            dismissButton: .default(Text("OK"))
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
